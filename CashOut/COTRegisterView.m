//
//  COTRegisterView.m
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "COTRegisterView.h"
#import "Utility.h"


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
-(void) openDB{
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open.");
    }
}
-(void)createTableNamed:(NSString *)tableName{
    char *err;
    NSString *sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name TEXT PRIMARY KEY, success NUMBER);", tableName];
    if (sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }
}
/*
-(BOOL)checkName:(NSString *)name{
    char *err;

    NSString *sql = [NSString stringWithFormat:@"SELECT COUNT(*) FROM sqlite_master where type='table' and name='%@';",name];
    const char *sql_stmt = [sql UTF8String];
    if(sqlite3_exec(db, sql_stmt, NULL, NULL, &err) == 1){
        return YES;
    }else{
        return NO;
    }
}
*/
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
    [self openDB];
    [self createTableNamed:TName.text];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"Your account has been created. Please back to Student Progress System and add your students. You can enter the SPS through the option button on the main screen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
            
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
