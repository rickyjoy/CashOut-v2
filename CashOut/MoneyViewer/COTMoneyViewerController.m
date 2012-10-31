//
//  COTMoneyViewerController.m
//  MoneyViewer
//
//  Created by Yongguang Li on 12-10-18.
//  Copyright (c) 2012 SFU-CMPT275-GROUP10. All rights reserved.
//Purpose:  COTMoneyViewerController.m responses the action on MoneyViewer Controller.
//          To enable the user interaction for viewing a money or coin.
//In Development:   A properly picture for money enlarging. Therefore, MoneyEnlarge.png is using for purpose.

#import "COTMoneyViewerController.h"

@interface COTMoneyViewerController(){
}

@end

@implementation COTMoneyViewerController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// default set up for MoneyViewer
    [self defaultEnvironment];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)defaultEnvironment{
    // Setting the default environment
    // default button
    // default background
    // default moneytext message disable
    [self defaultButtonSetting];
    [self defaultBackgroundSetting];
    // the instruction text for the money view
    instructionText.text = @"Tap up the money to enlarge";
}

- (void)defaultButtonSetting{
    // Setting the default button statu
    // disable all the hidden button(moneyview button)
    [self hiddenButtonDefaultSetting];
    // disable the outside button
    [self disableOutSideDectector];
    // enable the enlarge money button
    [self clickButtonEnable];
}

- (void)hiddenButtonDefaultSetting{
    // hidden all the money view button
    hundredFront.hidden = YES;
    hundredFront.enabled = NO;
    hundredBack.hidden = YES;
    hundredBack.enabled = NO;
    fiftyFront.hidden = YES;
    fiftyFront.enabled = NO;
    fiftyBack.hidden = YES;
    fiftyBack.enabled = NO;
    twentyFront.hidden = YES;
    twentyFront.enabled = NO;
    twentyBack.hidden = YES;
    twentyBack.enabled = NO;
    tenFront.hidden = YES;
    tenFront.enabled = NO;
    tenBack.hidden = YES;
    tenBack.enabled = NO;
    fiveFront.hidden = YES;
    fiveFront.enabled = NO;
    fiveBack.hidden = YES;
    fiveBack.enabled = NO;
    twoFront.hidden = YES;
    twoFront.enabled = NO;
    twoBack.hidden = YES;
    twoBack.enabled = NO;
    oneFront.hidden = YES;
    oneFront.enabled = NO;
    oneBack.hidden = YES;
    oneBack.enabled = NO;
    quarterFront.hidden = YES;
    quarterFront.enabled = NO;
    quarterBack.hidden = YES;
    quarterBack.enabled = NO;
    nickelFront.hidden = YES;
    nickelFront.enabled = NO;
    nickelBack.hidden = YES;
    nickelBack.enabled = NO;
    dimeFront.hidden = YES;
    dimeFront.enabled = NO;
    dimeBack.hidden = YES;
    dimeBack.enabled = NO;
    pennyFront.hidden = YES;
    pennyFront.enabled = NO;
    pennyBack.hidden = YES;
    pennyBack.enabled = NO;
}

- (void)defaultBackgroundSetting{
    // The alpha value for the background fade 0.5
    // The Background Setting is to fade the background when a money is enlarged
    outsideTopButton.backgroundColor = [UIColor grayColor];
    outsideBottomButton.backgroundColor = [UIColor grayColor];
    outsideLeftButton.backgroundColor = [UIColor grayColor];
    outsideRightButton.backgroundColor = [UIColor grayColor];
    outsideTopButton.alpha = 0.5;
    outsideBottomButton.alpha = 0.5;
    outsideLeftButton.alpha = 0.5;
    outsideRightButton.alpha = 0.5;
}

- (void)clickButtonDisable{
    // Disable all the enlarge money button
    clickHundredButton.enabled = NO;
    clickFiftyButton.enabled = NO;
    clickTwentyButton.enabled = NO;
    clickTenButton.enabled = NO;
    clickFiveButton.enabled = NO;
    // The instruction should shows off as well
    [self instructionTextOff];
}

- (void)clickButtonEnable{
    // Enable all the enlarge money button
    clickHundredButton.enabled = YES;
    clickFiftyButton.enabled = YES;
    clickTwentyButton.enabled = YES;
    clickTenButton.enabled = YES;
    clickFiveButton.enabled = YES;
    // the instrction should shows On as well to instruct user
    [self instructionTextOn];
}

- (void)disableOutSideDectector{
    // Disable the outside button and hidden them
    outsideTopButton.hidden = YES;
    outsideTopButton.enabled = NO;
    outsideBottomButton.hidden = YES;
    outsideBottomButton.enabled = NO;
    outsideLeftButton.hidden = YES;
    outsideLeftButton.enabled = NO;
    outsideRightButton.hidden = YES;
    outsideRightButton.enabled = NO;
}

- (void)enableOutSideDetector{
    // Enable the outside button and show them
    outsideTopButton.hidden = NO;
    outsideTopButton.enabled = YES;
    outsideBottomButton.hidden = NO;
    outsideBottomButton.enabled = YES;
    outsideLeftButton.hidden = NO;
    outsideLeftButton.enabled = YES;
    outsideRightButton.hidden = NO;
    outsideRightButton.enabled = YES;
}

- (void)displayMoneyText:(NSString *)textMessage{
    // Display a text for the current showing money
    moneyText.enabled = YES;
    // Message about money and instructions
    moneyText.text = [textMessage stringByAppendingString:@"\nTap up the money to flip\nTap up the gray layer to quit the enlarge view"];
}

- (void)moneyTextClean{
    // Disable the moneyText and clean the text
    moneyText.text = NULL;
    moneyText.enabled = NO;
}

- (void)instructionTextOn{
    // the instruction appears
    instructionText.hidden = NO;
}

- (void)instructionTextOff{
    // hide the instruction text
    instructionText.hidden = YES;
}

- (IBAction)clickHundredDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    hundredFront.hidden = NO;
    hundredFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is an one hundred dollar bill"]; 
}

- (IBAction)clickHundredDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    hundredFront.hidden = YES;
    hundredFront.enabled = NO;
    hundredBack.hidden = NO;
    hundredBack.enabled = YES;
    
}

- (IBAction)clickHundredDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    hundredBack.hidden = YES;
    hundredBack.enabled = NO;
    hundredFront.hidden = NO;
    hundredFront.enabled = YES;
}

- (IBAction)clickFiftyDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    fiftyFront.hidden = NO;
    fiftyFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a fifty dollar bill"]; 
}

- (IBAction)clickFiftyDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    fiftyFront.hidden = YES;
    fiftyFront.enabled = NO;
    fiftyBack.hidden = NO;
    fiftyBack.enabled = YES;
}

- (IBAction)clickFiftyDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    fiftyBack.hidden = YES;
    fiftyBack.enabled = NO;
    fiftyFront.hidden = NO;
    fiftyFront.enabled = YES;
}

- (IBAction)clickTwentyDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    twentyFront.hidden = NO;
    twentyFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a twenty dollar bill"];
}

- (IBAction)clickTwentyDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    twentyFront.hidden = YES;
    twentyFront.enabled = NO;
    twentyBack.hidden = NO;
    twentyBack.enabled = YES;
}

- (IBAction)clickTwentyDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    twentyBack.hidden = YES;
    twentyBack.enabled = NO;
    twentyFront.hidden = NO;
    twentyFront.enabled = YES;
}

- (IBAction)clickTenDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    tenFront.hidden = NO;
    tenFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a ten dollar bill"];
}

- (IBAction)clickTenDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    tenFront.hidden = YES;
    tenFront.enabled = NO;
    tenBack.hidden = NO;
    tenBack.enabled = YES;
    
}

- (IBAction)clickTenDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    tenBack.hidden = YES;
    tenBack.enabled = NO;
    tenFront.hidden = NO;
    tenFront.enabled = YES;
}

- (IBAction)clickFiveDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    fiveFront.hidden = NO;
    fiveFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a five dollar bill"];
}

- (IBAction)clickFiveDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    fiveFront.hidden = YES;
    fiveFront.enabled = NO;
    fiveBack.hidden = NO;
    fiveBack.enabled = YES;
}

- (IBAction)clickFiveDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    fiveBack.hidden = YES;
    fiveBack.enabled = NO;
    fiveFront.hidden = NO;
    fiveFront.enabled = YES;
}

- (IBAction)clickTwoDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    twoFront.hidden = NO;
    twoFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a two dollar coin"];
}

- (IBAction)clickTwoDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    twoFront.hidden = YES;
    twoFront.enabled = NO;
    twoBack.hidden = NO;
    twoBack.enabled = YES;
}

- (IBAction)clickTwoDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    twoBack.hidden = YES;
    twoBack.enabled = NO;
    twoFront.hidden = NO;
    twoFront.enabled = YES;
}

- (IBAction)clickOneDollar{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    oneFront.hidden = NO;
    oneFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a one dollar coin"];
}

- (IBAction)clickOneDollarFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    oneFront.hidden = YES;
    oneFront.enabled = NO;
    oneBack.hidden = NO;
    oneBack.enabled = YES;
}

- (IBAction)clickOneDollarBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    oneBack.hidden = YES;
    oneBack.enabled = NO;
    oneFront.hidden = NO;
    oneFront.enabled = YES;
}

- (IBAction)clickTwentyfiveCents{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    quarterFront.hidden = NO;
    quarterFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a twentyfive cents coin"];
}

- (IBAction)clickTwentyfiveCentsFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    quarterFront.hidden = YES;
    quarterFront.enabled = NO;
    quarterBack.hidden = NO;
    quarterBack.enabled = YES;
}

- (IBAction)clickTwentyfiveCentsBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    quarterBack.hidden = YES;
    quarterBack.enabled = NO;
    quarterFront.hidden = NO;
    quarterFront.enabled = YES;
}

- (IBAction)clickTenCents{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    nickelFront.hidden = NO;
    nickelFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a ten cents coin"];
}

- (IBAction)clickTenCentsFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    nickelFront.hidden = YES;
    nickelFront.enabled = NO;
    nickelBack.hidden = NO;
    nickelBack.enabled = YES;
}

- (IBAction)clickTenCentsBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    nickelBack.hidden = YES;
    nickelBack.enabled = NO;
    nickelFront.hidden = NO;
    nickelFront.enabled = YES;
}

- (IBAction)clickFiveCents{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    dimeFront.hidden = NO;
    dimeFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is a five cents coin"];
}

- (IBAction)clickFiveCentsFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    dimeFront.hidden = YES;
    dimeFront.enabled = NO;
    dimeBack.hidden = NO;
    dimeBack.enabled = YES;
}

- (IBAction)clickFiveCentsBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    dimeBack.hidden = YES;
    dimeBack.enabled = NO;
    dimeFront.hidden = NO;
    dimeFront.enabled = YES;
}

- (IBAction)clickOneCent{
    // Disable the enlarge button and enable the outside button
    [self clickButtonDisable];
    [self enableOutSideDetector];
    // set the front view as default view
    pennyFront.hidden = NO;
    pennyFront.enabled = YES;
    // display the text to introduce the current displaying money
    [self displayMoneyText:@"This is an one cent coin"];
}

- (IBAction)clickOneCentFront{
    // hidden the front view of money "flip" to the back view of money
    // disable the front view button, and make the back view button available
    pennyFront.hidden = YES;
    pennyFront.enabled = NO;
    pennyBack.hidden = NO;
    pennyBack.enabled = YES;
}

- (IBAction)clickOneCentBack{
    // hidden the back view of money "flip" to the front view of money
    // disable the back view button, and make the front view button available
    pennyBack.hidden = YES;
    pennyBack.enabled = NO;
    pennyFront.hidden = NO;
    pennyFront.enabled = YES;
}

- (IBAction)outsideTop{
    // back to the initial state, which enlarge image disapper, and enlarge button enabled
    // the text should be clean as well
    [self moneyTextClean];
    [self defaultButtonSetting];
}

- (IBAction)outsideBottom{
    // back to the initial state, which enlarge image disapper, and enlarge button enabled
    // the text should be clean as well
    [self moneyTextClean];
    [self defaultButtonSetting];
}

- (IBAction)outsideLeft{
    // back to the initial state, which enlarge image disapper, and enlarge button enabled
    // the text should be clean as well
    [self moneyTextClean];
    [self defaultButtonSetting];
}

- (IBAction)outsideRight{
    // back to the initial state, which enlarge image disapper, and enlarge button enabled
    // the text should be clean as well
    [self moneyTextClean];
    [self defaultButtonSetting];
}

@end
