//
//  COTRegisterView.h
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"
#import "COTLoginView.h"


@interface COTRegisterView : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *TName;
@property (weak, nonatomic) IBOutlet UITextField *TPassword;
@property (weak, nonatomic) IBOutlet UITextField *TRepassword;


- (IBAction)RegisterPressed:(id)sender;

-(NSString *) filePath;
-(void) openDB:(sqlite3 *) database;
-(void) createTableNamed:(NSString *) tableName withField1:(NSString *) field1 withField2:(NSString *) field2;
-(void) insertRecordIntoTableNamed:(NSString *) tableName withField1:(NSString *) field1 field1Value:(NSString *) field1Value withField2: (NSString *)field2 field2Value:(NSString *) field2Value;

@end
