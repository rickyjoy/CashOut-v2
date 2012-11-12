//
//  COTRegisterView.m
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "COTRegisterView.h"
#import "Utility.h"
#import "FMDatabase.h"

@implementation COTRegisterView
@synthesize TName;
@synthesize TPassword;
@synthesize TRepassword;
//database methods

-(NSString *) filePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:@"data.sqlite3"];
}
/*
-(void) openDB{
    FMDatabase* db = [FMDatabase databaseWithPath:[self filePath]];
    [db open];
}

-(void)createTableNamed:(NSString *)tableName{
    char *err;
    NSString *sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name TEXT PRIMARY KEY, success NUMBER, total NUMBER);", tableName];
    if (sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }
}

//insert the teacher's name and password into the 'teachers' table in the database
//these data will be used for the login function
-(void)createTeacher:(NSString *)name Tpassword:(NSString *)password{
    sqlite3_stmt *statment;
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO teachers (name, password) VALUES ('%@', '%@')",name, password];
    const char *insert_stmt = [insertSQL UTF8String];
    sqlite3_prepare_v2(db, insert_stmt, -1, &statment, NULL);
    sqlite3_step(statment);
}

*/

-(bool) isTableOK:(FMDatabase *)db
    withTableName:(NSString *)tableName{
    FMResultSet *rs = [db executeQuery:@"select password from teachers where name = ?", tableName];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"password"];
        if (0 == count){
            return NO;
        }
        else{
            return YES;
        }
    }
    return NO;
}

- (IBAction)RegisterPressed:(id)sender {
    if([TName.text length]<=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please enter your name" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }else if([TPassword.text length]<=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please enter your password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }else if([TRepassword.text length]<=0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please confirm your password" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }
    
    if(![Utility isValidateString:TPassword.text]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Your password must be English words or numbers" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }else if(![TPassword.text isEqualToString:TRepassword.text]){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"The passwords you entered two times are different" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        return;
    }

    FMDatabase* db = [FMDatabase databaseWithPath:[self filePath]];
    [db open];
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO teachers (name, password) VALUES ('%@', '%@')", TName.text, TPassword.text];
    NSString *sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name TEXT PRIMARY KEY, success NUMBER, total NUMBER);", TName.text];
    if(![self isTableOK:db withTableName:TName.text]){
        [db executeUpdate:sql];
        [db executeUpdate:sql_stmt];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"Your account has been created. Please back to Student Progress System and add your students. You can enter the SPS through the option button on the main screen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
        
    }else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Sorry, you have already created an account." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    [db close];

}

- (id)initWithibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTName:nil];
    [self setTPassword:nil];
    [self setTRepassword:nil];
    [super viewDidUnload];
}
@end
