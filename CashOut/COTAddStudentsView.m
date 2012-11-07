//
//  COTAddStudentsView.m
//  CashOut
//
//  Created by Rick on 11/6/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "COTAddStudentsView.h"

@interface COTAddStudentsView ()

@end

@implementation COTAddStudentsView
@synthesize TName;
@synthesize SName;

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

- (IBAction)buttonPressed:(id)sender {
    [self openDB];
    sqlite3_stmt *statment;

    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO '%@' (name,success) VALUES ('%@')",TName.text, SName.text];
    const char *insert_stmt = [insertSQL UTF8String];
    sqlite3_prepare_v2(db, insert_stmt, -1, &statment, NULL);
    if(sqlite3_step(statment)!=SQLITE_DONE){
        sqlite3_close(db);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Fail to add student. Please check the teacher's name and try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        sqlite3_close(db);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Add student successfully. You may add more students." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
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
    [self setSName:nil];
    [self setTName:nil];
    [super viewDidUnload];
}

@end
