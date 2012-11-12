//
//  COTOptionView.h
//  CashOut
//
//  Created by Rick on 11/7/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface COTOptionView : UIViewController{
    IBOutlet UIButton *logoutButton;
    IBOutlet UIButton *SPSButton;
    sqlite3 *db;
}


- (IBAction)logoutAction:(id)sender;
- (IBAction)SPSAction:(id)sender;
-(NSString *) filePath;
-(void) openDB;
-(Boolean) isLogged;
-(NSString *) whoIsLogged;
-(void) logoutCurrentTeacher:(NSString *) currentTeacherName;

@end
