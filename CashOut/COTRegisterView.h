//
//  COTRegisterView.h
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "FMDatabase.h"

@interface COTRegisterView : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *TName;
@property (strong, nonatomic) IBOutlet UITextField *TPassword;
@property (strong, nonatomic) IBOutlet UITextField *TRepassword;


- (IBAction)RegisterPressed:(id)sender;

-(NSString *) filePath;

-(void) openDB;
-(void) createTableNamed:(NSString *) tableName;
-(void) createTeacher:(NSString *)name Tpassword:(NSString *)password;
//-(bool) isNewAccount:(NSString *)tableName;

-(bool) isTableOK:(FMDatabase *)db
    withTableName:(NSString *)tableName;

@end
