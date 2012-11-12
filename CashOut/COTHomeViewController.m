//
//  COTHomeViewController.m
//  CashOut
//
//  Created by Rick on 10/16/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//
//
#import "COTHomeViewController.h"


@interface COTHomeViewController ()

@end

@implementation COTHomeViewController

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)createDBStructureIfNotExist
{
    [self openDB];//to open the database
    char *err;
    NSString * sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS teachers (name TEXT PRIMARY KEY, password TEXT);"];//the sql to create a new table as teacher validation infomation, acount and  password as a filed.
    if (sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK)//condition that teacher table falis
    {
        sqlite3_close(db);
        NSAssert(0, @"teacher tabled failed to create.");
    }
    sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS system (currentTeacher TEXT, currentStudent TEXT);"];//the sql to create a new table as teacher validation infomation, acount and  password as a filed.
    if (sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK)//condition that teacher table falis
    {
        sqlite3_close(db);
        NSAssert(0, @"system tabled failed to create.");
    }
    
    sqlite3_close(db);
    
    
}

-(Boolean) isLogged
{
    [self openDB];//to open the database
    //1 is a account exist for the counting statement in sqlite3,register reject.
    //count the existence of user inputed account.
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



- (void)viewDidLoad
{

    //UIImage *image = [UIImage imageNamed:@"background.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    [self createDBStructureIfNotExist];
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewWillDisappear:animated];
}
- (IBAction)enterButton:(id)sender
{
    if([self isLogged])
    {
        NSLog(@"I am logged");
        [self performSegueWithIdentifier:@"Home to Logged Scene" sender:sender];
        
    }
    else
    {
        NSLog(@"I am not logged");
        [self performSegueWithIdentifier:@"Home to Log in Scene" sender:sender];
    }
    
}


@end

