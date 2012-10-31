//
//  COTMoneyViewerController.h
//  MoneyViewer
//
//  Created by Yongguang Li on 12-10-18.
//  Copyright (c) 2012 SFU-CMPT275-GROUP10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COTMoneyViewerController : UIViewController{
    // delcare the outlet of button for each view of money
    IBOutlet UIButton *hundredFront;
    IBOutlet UIButton *hundredBack;
    IBOutlet UIButton *fiftyFront;
    IBOutlet UIButton *fiftyBack;
    IBOutlet UIButton *twentyFront;
    IBOutlet UIButton *twentyBack;
    IBOutlet UIButton *tenFront;
    IBOutlet UIButton *tenBack;
    IBOutlet UIButton *fiveFront;
    IBOutlet UIButton *fiveBack;
    IBOutlet UIButton *twoFront;
    IBOutlet UIButton *twoBack;
    IBOutlet UIButton *oneFront;
    IBOutlet UIButton *oneBack;
    IBOutlet UIButton *quarterFront;
    IBOutlet UIButton *quarterBack;
    IBOutlet UIButton *nickelFront;
    IBOutlet UIButton *nickelBack;
    IBOutlet UIButton *dimeFront;
    IBOutlet UIButton *dimeBack;
    IBOutlet UIButton *pennyFront;
    IBOutlet UIButton *pennyBack;
    // declare the outlet of button for enlarge view, relate to each enlarge button
    IBOutlet UIButton *clickHundredButton;
    IBOutlet UIButton *clickFiftyButton;
    IBOutlet UIButton *clickTwentyButton;
    IBOutlet UIButton *clickTenButton;
    IBOutlet UIButton *clickFiveButton;
    IBOutlet UIButton *clickTwoButton;
    IBOutlet UIButton *clickOneButton;
    IBOutlet UIButton *clickQuarterButton;
    IBOutlet UIButton *clickNickelButton;
    IBOutlet UIButton *clickDimeButton;
    IBOutlet UIButton *clickPennyButton;
    // declare the outlet of button for the four areas
    // this area is being actived when a enlarge view is actived,
    // anything is not within the button for each view of money is outsideArea
    IBOutlet UIButton *outsideTopButton;
    IBOutlet UIButton *outsideBottomButton;
    IBOutlet UIButton *outsideLeftButton;
    IBOutlet UIButton *outsideRightButton;
    // A text to decribing the current displaying money
    IBOutlet UILabel *moneyText;
    // A text for instruction
    IBOutlet UILabel *instructionText;
    
}

// the action relate to each button action above
- (IBAction)clickHundredDollar;
- (IBAction)clickHundredDollarFront;
- (IBAction)clickHundredDollarBack;
- (IBAction)clickFiftyDollar;
- (IBAction)clickFiftyDollarFront;
- (IBAction)clickFiftyDollarBack;
- (IBAction)clickTwentyDollar;
- (IBAction)clickTwentyDollarFront;
- (IBAction)clickTwentyDollarBack;
- (IBAction)clickTenDollar;
- (IBAction)clickTenDollarFront;
- (IBAction)clickTenDollarBack;
- (IBAction)clickFiveDollar;
- (IBAction)clickFiveDollarFront;
- (IBAction)clickFiveDollarBack;
- (IBAction)clickTwoDollar;
- (IBAction)clickTwoDollarFront;
- (IBAction)clickTwoDollarBack;
- (IBAction)clickOneDollar;
- (IBAction)clickOneDollarFront;
- (IBAction)clickOneDollarBack;
- (IBAction)clickTwentyfiveCents;
- (IBAction)clickTwentyfiveCentsFront;
- (IBAction)clickTwentyfiveCentsBack;
- (IBAction)clickTenCents;
- (IBAction)clickTenCentsFront;
- (IBAction)clickTenCentsBack;
- (IBAction)clickFiveCents;
- (IBAction)clickFiveCentsFront;
- (IBAction)clickFiveCentsBack;
- (IBAction)clickOneCent;
- (IBAction)clickOneCentFront;
- (IBAction)clickOneCentBack;
// the action relate to outsideArea
// anything is not within the button for each view of money is outsideArea
- (IBAction)outsideTop;
- (IBAction)outsideBottom;
- (IBAction)outsideLeft;
- (IBAction)outsideRight;



@end
