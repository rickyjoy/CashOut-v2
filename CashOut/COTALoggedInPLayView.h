//
//  COTALoggedInPLayView.h
//  CashOut
//
//  Created by Rick on 11/3/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface COTALoggedInPLayView : UIViewController{
    sqlite3 *db;
    IBOutlet UILabel *teacherNameDisplay;
}

-(NSString *) filePath;
-(void) openDB;
-(Boolean) isLogged;
-(NSString *) whoIsLogged;

@end