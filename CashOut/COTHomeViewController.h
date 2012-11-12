//
//  COTHomeViewController.h
//  CashOut
//
//  Created by Rick on 10/16/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
#import <sqlite3.h>
@interface COTHomeViewController : UIViewController{
    sqlite3 *db;
}

-(NSString *) filePath;
-(void) openDB;
-(void) createDBStructureIfNotExist;
-(Boolean) isLogged;
- (IBAction)enterButton:(id)sender;//the button to enter the CashOut


@end
