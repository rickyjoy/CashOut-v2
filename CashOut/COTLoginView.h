//
//  COTLoginView.h
//  CashOut
//
//  Created by Rick on 11/3/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface COTLoginView : UIViewController{
    sqlite3 *db;
    IBOutlet UIButton *loginOutlet;
    IBOutlet UIButton *registerOutlet;
    IBOutlet UIButton *freeplayOutlet;
    IBOutlet UITextField *teacherField;
    IBOutlet UITextField *passowordField;
    IBOutlet UILabel *instructionMessage;
}

-(NSString *) filePath;
-(void) openDB;
-(Boolean) isLogged;
-(void) setSystemState:(NSString *) teacherName;
- (IBAction)loginButton:(id)sender;//the button to login

@end
