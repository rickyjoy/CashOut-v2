//
//  COTRegisterView.h
//  CashOut
//
//  Created by Rick on 11/2/12.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface COTRegisterView : UIViewController{
    sqlite3 *db;
}

@property (strong, nonatomic) IBOutlet UITextField *TName;
@property (strong, nonatomic) IBOutlet UITextField *TPassword;
@property (strong, nonatomic) IBOutlet UITextField *TRepassword;


- (IBAction)RegisterPressed:(id)sender;

-(NSString *) filePath;
-(void) openDB;
-(void) createTableNamed:(NSString *) tableName;
-(void) insertRecordIntoTableNamed:(NSString *) tableName withField1:(NSString *) field1 field1Value:(NSString *) field1Value withField2: (NSString *)field2 field2Value:(NSString *) field2Value;

@end
