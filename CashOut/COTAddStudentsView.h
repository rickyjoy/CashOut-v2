//
//  COTAddStudentsView.h
//  CashOut
//
//  Created by Rick on 11/6/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "COTRegisterView.h"

@interface COTAddStudentsView : UIViewController{
    sqlite3 *db;
}

@property (strong, nonatomic) IBOutlet UITextField *SName;
@property (strong, nonatomic) IBOutlet UITextField *TName;
- (IBAction)buttonPressed:(id)sender;
@end
