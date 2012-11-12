//
//  COTLoginView.m
//  CashOut
//
//  Created by Rick on 11/3/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "COTLoginView.h"
#import "Utility.h"

@interface COTLoginView ()

@end

@implementation COTLoginView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(NSString *) filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    
    return [documentsDir stringByAppendingPathComponent:@"data.sqlite3"];
}
-(void) openDB{
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK)//to check if the  database is invalid
    {
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open.");
    }
}
- (void)viewDidLoad
{
    int alphaVlueDisplay = 1;
    int alphaVlueTransparency = 0;
    //if the account is logged we don't want them keep login
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    //when a user is logged, we disable the button and force the user to home scrren, prevent mutiple login
    if([self isLogged])
    {
        loginOutlet.enabled = FALSE;
        registerOutlet.enabled = FALSE;
        freeplayOutlet.enabled = FALSE;
        instructionMessage.alpha = alphaVlueDisplay;
    }
    else
    {
        loginOutlet.enabled = TRUE;
        registerOutlet.enabled = TRUE;
        freeplayOutlet.enabled = TRUE;
        instructionMessage.alpha = alphaVlueTransparency;
    }
    teacherField.text = nil;
    passowordField.text = nil;
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(Boolean) isLogged
{
    [self openDB];//to open the database
    //find a currentTeacher in the system
    NSString *sql_stmt = [NSString stringWithFormat:@"SELECT currentTeacher FROM system;"];
    sqlite3_stmt *statement;
    //check the valid expression, if not we close the database.
    if(sqlite3_prepare_v2(db, [sql_stmt UTF8String], -1, &statement,nil) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Failer to connect system table.");
        return FALSE;
    }
    else
    {
        NSString *currentTeacher;
        //read a currentTeacher
        if(sqlite3_step(statement) == SQLITE_ROW)
        {
            //the current teacher in system
            currentTeacher = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement,0)];
        }
        sqlite3_finalize(statement);//we need to exit after reading data, prevent for blocking.
        sqlite3_close(db);
        if(!currentTeacher)
        {
            return FALSE;
        }
        else//the currentTeacher is not nil, then we have a teacher logged
        {
            return TRUE;
        }
        
        
    }
}
//to check the user enter correct account information
//TRUE = ACCOUNT VALID
//FALSE = ACCOUNT INVALID
-(Boolean)accountIsExist:(NSString *) teacherName : (NSString *) password;
{
    [self openDB];//to open the database
    NSString* sql_stmt = [NSString stringWithFormat:@"SELECT COUNT(*) FROM teachers WHERE name='%@' and password ='%@';",teacherName,password];
    NSLog(@"%@",sql_stmt);
    sqlite3_stmt *statement;
    if(sqlite3_prepare_v2(db, [sql_stmt UTF8String], -1, &statement,nil) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Failer to check the avability.");
    }
    else
    {
        if(sqlite3_step(statement) == SQLITE_ROW)//read the avalable row info from sqlite statement response
        {
            NSString *isExist = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement,0)];
            sqlite3_finalize(statement);//we need to exit for reading data, prevent for blocking.
            if([isExist isEqualToString: @"1"])//there is such one account exist
            {
                NSLog(@"%@", isExist);
                return TRUE;
            }
        }
        else
        {
            sqlite3_close(db);
            NSAssert(0,@"Failer to serach the account info at database.");
            return FALSE;
        }
        
    }
    return FALSE;
}
//a function to update the system state.
-(void)setSystemState:(NSString *) teacherName
{
    [self openDB];
    char *err;
    NSString* sql_stmt = [NSString stringWithFormat:@"INSERT INTO system(currentTeacher) VALUES('%@');",teacherName];
    NSLog(@"%@",sql_stmt);
    if(sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0, @"falied to update a teacher in system table!");
        NSLog(@"falied to update a teacher in system table!");
        return;
    }
    sqlite3_close(db);
    
    
}
//we should check the account is exist or not
//then should check the account and password is valid.
//then we need to change the state for the CashOut to logged in. A teacher will automatically logged on until it logs out.
-(IBAction)loginButton:(id)sender
{
    //we need have two value to store the data input
    //avoidence for keeping using the text directly may cause error when user change text in processing time.
    NSString *account = teacherField.text;
    NSString *password = passowordField.text;
    // the regular check for the user input account and password. invaild expression do not consider to evaluate.
    if([account length]<=0)//to check condition that teacher name is not been entered
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please enter your name" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    else if([password length]<=0)//to check condition that a passowrd is not been entered
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please enter your password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    else if(![Utility isValidateString:account] || ![Utility isValidateString:password])//to check the string is only in alphabet or numeric
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your account and password can only contain alphabet or numbers" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    else// start to validate the account
    {
        //check a account is exist or not
        //check the account is valid or not
        //push to logged scene if account pass the validation
        if([self accountIsExist:account:password])
        {
            //the account is valid then we should change the system state to have a teacher.
            [self setSystemState:account];
            [self viewDidLoad];
            [self performSegueWithIdentifier:@"Log in To Logged in Play Scene" sender:sender];// to the logged in play scene
        }
        else    //warning message and do not push to logged in play scene
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login error" message:@"We couldn't match the Teacher's name or Password entered to a CashOut account." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    }
}
@end
