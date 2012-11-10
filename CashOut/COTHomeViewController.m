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
<<<<<<< HEAD
    return [documentsDir stringByAppendingPathComponent:@"data.sqlite3"];
}
-(void) openDB{
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open.");
    }
=======
    return [documentsDir stringByAppendingPathComponent:@"data.db"];
>>>>>>> finally
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
<<<<<<< HEAD
    [self openDB];
    char *err;
    NSString *sql_stmt = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS teachers (name TEXT PRIMARY KEY, password TEXT);"];
    if (sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK){
        sqlite3_close(db);
        NSAssert(0, @"Tabled failed to create.");
    }

=======
    FMDatabase* db = [FMDatabase databaseWithPath:[self filePath]];
    [db open];
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS teachers (name TEXT PRIMARY KEY, password TEXT)"];
    [db executeUpdate:sql];
    [db close];
>>>>>>> finally
    //UIImage *image = [UIImage imageNamed:@"background.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
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

@end
