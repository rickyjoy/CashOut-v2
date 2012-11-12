//
//  COTALoggedInPLayView.m
//  CashOut
//
//  Created by Rick on 11/7/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "COTALoggedInPLayView.h"

@interface COTALoggedInPLayView ()

@end

@implementation COTALoggedInPLayView

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
//to open the database
-(void) openDB{
    if(sqlite3_open([[self filePath] UTF8String], &db) != SQLITE_OK)//to check if the  database is invalid
    {
        sqlite3_close(db);
        NSAssert(0,@"Database failed to open.");
    }
}

//a founction
//return TRUE if a teacher is logged
//return FALSE if none logged
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
//a function to check who is logged in the system and return the user name
-(NSString *) whoIsLogged
{
    NSString* currentTeacherName;// the teacher that is currently logged
    [self openDB];
    NSString *sql_stmt = [NSString stringWithFormat:@"SELECT currentTeacher FROM system;"];
    sqlite3_stmt *statement;
    //check the valid expression, if not we close the database.
    if(sqlite3_prepare_v2(db, [sql_stmt UTF8String], -1, &statement,nil) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0,@"Failer to connect system table.");
        return currentTeacherName;
    }
    else
    {
        //read a currentTeacher
        if(sqlite3_step(statement) == SQLITE_ROW)
        {
            //the current teacher in system
            currentTeacherName = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement,0)];
        }
        sqlite3_finalize(statement);//we need to exit after reading data, prevent for blocking.
        sqlite3_close(db);
    }
    return currentTeacherName;
}
//a function to log out a teacher that is current logged
-(void) logoutCurrentTeacher:(NSString *) currentTeacherName
{
    [self openDB];
    char *err;
    NSString* sql_stmt = [NSString stringWithFormat:@"DELETE FROM system Where currentTeacher='%@';",currentTeacherName];
    NSLog(@"%@",sql_stmt);
    if(sqlite3_exec(db, [sql_stmt UTF8String], NULL, NULL, &err) != SQLITE_OK)
    {
        sqlite3_close(db);
        NSAssert(0, @"falied to log out!");
        NSLog(@"falied to log out");
        return;
    }
    sqlite3_close(db);
    
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    //if not user loggout, we suppose do let them act as log gin
    if([self isLogged])
    {
        NSLog(@"ENTER TEACHER SELECT AND LOGGED");
        teacherNameDisplay.text = [self whoIsLogged];
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
