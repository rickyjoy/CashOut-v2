//
//  SimpleCompareVC.m
//  CashOut
//
//  Created by Tyson Nickel on 2012-10-18.
//  Copyright (c) 2012 Rick. All rights reserved.
//
// Simple Compare Level 1 - Compare a quarter to nickels! (1 quarter from 6 nickels)

#import "SimpleCompareVC.h"
#import "ImageToDrag.h"

@interface SimpleCompareVC ()

@end

//Declare any objects/values here (GLOBAL)
int score;
int req_score;
int currentLevel;

CGRect recieve;
UIView *recieve_view;
UIView *subview;

ImageToDrag *LHS;
ImageToDrag *img1;
ImageToDrag *img2;
ImageToDrag *img3;
ImageToDrag *img4;
ImageToDrag *img5;
ImageToDrag *img6;
ImageToDrag *img7;
ImageToDrag *img8;
ImageToDrag *img9;
ImageToDrag *img10;
ImageToDrag *img11;




@implementation SimpleCompareVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set up game area -------------------------------------------------------------------------

        //Size of currency view area

        //Subview represents the area the currency may be dragged in (Currently the full screen)
        subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 900)];
        subview.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:0];
    
        //Invisible area where played coins go
        //If currency intersects with this, score is increased accordingly
        recieve = CGRectMake(384, 0, 368, 658);
    
        //Visible rectangle for scoring area
        recieve_view = [[UIView alloc]initWithFrame:CGRectMake(384, 0, 384, 655)];
        recieve_view.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:0.25];
    
        //Want recieve_view above subview (and therefore visible)
        [self.view insertSubview:recieve_view aboveSubview:subview];
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    currentLevel = [standardUserDefaults integerForKey:@"bclevel"];
    [standardUserDefaults synchronize];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"level = %d", currentLevel);
    
    if(currentLevel == 1){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS.center = CGPointMake(245,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 5;
        
        //RHS

        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img1.center = CGPointMake(65,740);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];

        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img2.center = CGPointMake(182,740);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img3.center = CGPointMake(299,740);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img4.center = CGPointMake(416,740);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img5.center = CGPointMake(533,740);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img6.center = CGPointMake(650,740);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 2){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS.center = CGPointMake(245,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 10;
        
        //RHS
        
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img1.center = CGPointMake(65,740);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img2.center = CGPointMake(182,740);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img3.center = CGPointMake(299,740);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img4.center = CGPointMake(416,740);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img5.center = CGPointMake(533,740);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img6.center = CGPointMake(650,740);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img7.center = CGPointMake(65,860);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img8.center = CGPointMake(182,860);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img9.center = CGPointMake(299,860);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        img10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img10.center = CGPointMake(416,860);
        img10.userInteractionEnabled = YES;
        [subview addSubview:img10];
        
        img11 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img11.center = CGPointMake(533,860);
        img11.userInteractionEnabled = YES;
        [subview addSubview:img11];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 3){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS.center = CGPointMake(245,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 10;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img1.center = CGPointMake(65,740);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img2.center = CGPointMake(182,740);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img3.center = CGPointMake(299,740);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 4){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS.center = CGPointMake(245,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 25;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img1.center = CGPointMake(65,740);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img2.center = CGPointMake(182,740);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img3.center = CGPointMake(299,740);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img4.center = CGPointMake(65,860);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img5.center = CGPointMake(182,860);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img6.center = CGPointMake(299,860);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 5){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 100;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 6){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 200;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 7){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 200;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];

        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 8){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 500;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];

        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 9){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 1000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 10){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 1000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img1.center = CGPointMake(112,733);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img2.center = CGPointMake(325,733);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img3.center = CGPointMake(538,733);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 11){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 2000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 12){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 2000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        img10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img10.center = CGPointMake(456,821);
        img10.userInteractionEnabled = YES;
        [subview addSubview:img10];
        
        img11 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img11.center = CGPointMake(577,821);
        img11.userInteractionEnabled = YES;
        [subview addSubview:img11];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 13){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 5000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];

        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 14){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 5000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        img10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img10.center = CGPointMake(456,821);
        img10.userInteractionEnabled = YES;
        [subview addSubview:img10];
        
        img11 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img11.center = CGPointMake(577,821);
        img11.userInteractionEnabled = YES;
        [subview addSubview:img11];
        
        [self.view addSubview:subview];
    }
    
    else if(currentLevel == 15){
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"HundredDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 10000;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];

        [self.view addSubview:subview];
    }

    else if(currentLevel == 16){
        
        //LHS
        LHS = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"HundredDollarFront.png"]];
        LHS.center = CGPointMake(200,349);
        LHS.userInteractionEnabled = NO;
        [subview addSubview:LHS];
        req_score = 10000;
        
        //RHS
        
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img1.center = CGPointMake(112,733);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img2.center = CGPointMake(325,733);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img3.center = CGPointMake(538,733);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        [self.view addSubview:subview];
        
        
    }

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)go:(id)sender
{
    [super viewDidLoad];
    //Test game code. . .
    
    int levelVal = 0;
    
    //Scoring (Need if block for all levels??
    if (currentLevel == 1){
        levelVal = 1;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 2){
        levelVal = 1;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img10.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img11.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 3){
        levelVal = 5;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 4){
        levelVal = 5;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 5){
        levelVal = 25;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 6){
        levelVal = 100;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 7){
        levelVal = 25;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 8){
        levelVal = 100;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 9){
        levelVal = 200;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 10){
        levelVal = 500;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 11){
        levelVal = 1000;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 12){
        levelVal = 200;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img10.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img11.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 13){
        levelVal = 1000;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 14){
        levelVal = 500;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img10.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img11.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 15){
        levelVal = 2000;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + levelVal;
        }
    }
    else if(currentLevel == 16){
        levelVal = 5000;
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + levelVal;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + levelVal;
        }
    }
    
    NSLog(@"score = %d", score);
    
    
    if(score == req_score){
        
        score = 0;
        levelVal = 0;
        //Display "win" alert
        NSLog(@"Winner!");
        
        //Level success should be registered here (locally, on database, etc)-------------------------------------------------------
        
        //--------------------------------------------------------------------------------------------------------------------------
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct!" message:@"Level Complete!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        
        if(alert.tag = 100){
            //Pop back to level screen
            [self.navigationController popViewControllerAnimated:YES];
        }

    }
    //If incorrect, animate screen to red briefly.
    else if(score != req_score){
        
        //Reset score
        score = 0;
        NSLog(@"No dice!");
        
        //Animate red flash
        UIView *inc;
        inc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
        inc.backgroundColor = [[UIColor redColor]colorWithAlphaComponent:0.25];
        [self.view addSubview:inc];
        [UIView animateWithDuration:0.5
                         animations:^{
                             inc.alpha = 0;
                         }
                         completion:^(BOOL finished){
                             [inc removeFromSuperview];
                         }];
        //Level failure should be registered here (locally, on database, etc)-------------------------------------------------------
        
        //--------------------------------------------------------------------------------------------------------------------------
    }
    
    
}

@end
