//
//  COTRegisterView.h
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COTRegisterView : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TName;
@property (weak, nonatomic) IBOutlet UITextField *TPassword;
@property (weak, nonatomic) IBOutlet UITextField *TRepassword;


- (IBAction)RegisterPressed:(id)sender;

@end
