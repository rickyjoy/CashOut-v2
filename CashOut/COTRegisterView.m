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
    sqlite3 *db;
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open.");
    }
}
-(void) createTableNamed:(NSString *)tableName{
    char *err;
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' (name TEXT PRIMARY KEY, success TEXT);", tableName];
    if (sqlite3_exec(database, [sql UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(database);
        NSAssert(0, @"Tabled failed to create.");
    }
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

}
- (void)viewDidUnload {
    [self setTName:nil];
    [self setTPassword:nil];
    [self setTRepassword:nil];
    [super viewDidUnload];
}
@end
