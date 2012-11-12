//
//  Advanced Compare VC
//  CashOut
//
//  Created by Tyson Nickel on 2012-11-10
//  Copyright (c) 2012 Tyson. All rights reserved.
//
// Advanced Comparison Implementation


#import "AdvancedCompareVC.h"
#import "ImageToDrag.h"

@interface AdvancedCompareVC ()

@end

//Declare any objects/values here (GLOBAL)
int score;
int req_score;
int currentLevel;

CGRect recieve;
UIView *recieve_view;
UIView *subview;

ImageToDrag *LHS1;
ImageToDrag *LHS2;
ImageToDrag *LHS3;
ImageToDrag *LHS4;
ImageToDrag *LHS5;
ImageToDrag *LHS6;
ImageToDrag *LHS7;
ImageToDrag *LHS8;
ImageToDrag *LHS9;
ImageToDrag *LHS10;
ImageToDrag *LHS11;
ImageToDrag *LHS12;
ImageToDrag *LHS13;


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

@implementation AdvancedCompareVC

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
    currentLevel = [standardUserDefaults integerForKey:@"aclevel"];
    [standardUserDefaults synchronize];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"level = %d", currentLevel);
    
    if(currentLevel == 1){
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS1.center = CGPointMake(67,72);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS2.center = CGPointMake(163,75);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        req_score = 15;
        
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
    else if(currentLevel == 2){
        
        req_score = 35;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS1.center = CGPointMake(67,327);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS2.center = CGPointMake(291,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];

        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 3){
        
        req_score = 55;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS1.center = CGPointMake(67,72);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS2.center = CGPointMake(163,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS3.center = CGPointMake(291,65);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
                
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 4){
        
        req_score = 105;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS1.center = CGPointMake(67,452);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS2.center = CGPointMake(291,452);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
               
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
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        img10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img10.center = CGPointMake(456,821);
        img10.userInteractionEnabled = YES;
        [subview addSubview:img10];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 5){
        
        req_score = 207;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS1.center = CGPointMake(67,198);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS2.center = CGPointMake(291,198);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS3.center = CGPointMake(163,327);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS4.center = CGPointMake(67,452);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        LHS5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS5.center = CGPointMake(291,452);
        LHS5.userInteractionEnabled = NO;
        [subview addSubview:LHS5];;
        
        
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 6){
        req_score = 512;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS1.center = CGPointMake(67,72);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS2.center = CGPointMake(67,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS3.center = CGPointMake(67,583);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS4.center = CGPointMake(291,72);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        LHS5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS5.center = CGPointMake(291,327);
        LHS5.userInteractionEnabled = NO;
        [subview addSubview:LHS5];;
        
        LHS6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS6.center = CGPointMake(291,563);
        LHS6.userInteractionEnabled = NO;
        [subview addSubview:LHS6];;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 7){
        
        req_score = 555;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        LHS1.center = CGPointMake(67,198);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS2.center = CGPointMake(163,198);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"QuarterFront.png"]];
        LHS3.center = CGPointMake(67,198);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS4.center = CGPointMake(163,327);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
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
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 8){
        
        req_score = 2500;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS1.center = CGPointMake(67,327);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS2.center = CGPointMake(163,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        LHS3.center = CGPointMake(291,327);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
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
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 9){
        
        req_score = 2013;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS1.center = CGPointMake(67,327);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS2.center = CGPointMake(163,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS3.center = CGPointMake(67,583);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS4.center = CGPointMake(163,583);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        LHS5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS5.center = CGPointMake(291,452);
        LHS5.userInteractionEnabled = NO;
        [subview addSubview:LHS5];;
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 10){
        
        req_score = 5500;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS1.center = CGPointMake(291,583);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS2.center = CGPointMake(163,582);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS3.center = CGPointMake(67,452);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        LHS4.center = CGPointMake(163,327);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
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
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 11){
        
        req_score = 5000;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        LHS1.center = CGPointMake(163,327);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 12){
        
        req_score = 4510;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS1.center = CGPointMake(67,72);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS2.center = CGPointMake(291,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        LHS3.center = CGPointMake(67,452);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS4.center = CGPointMake(291,327);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
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
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img6.center = CGPointMake(577,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        img7.center = CGPointMake(577,753);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img8.center = CGPointMake(577,753);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 13){
        
        req_score = 6719;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS1.center = CGPointMake(67,72);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS2.center = CGPointMake(163,72);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS3.center = CGPointMake(291,72);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
        LHS4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS4.center = CGPointMake(67,198);
        LHS4.userInteractionEnabled = NO;
        [subview addSubview:LHS4];
        
        LHS5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS5.center = CGPointMake(163,198);
        LHS5.userInteractionEnabled = NO;
        [subview addSubview:LHS5];;
        
        LHS6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        LHS6.center = CGPointMake(291,198);
        LHS6.userInteractionEnabled = NO;
        [subview addSubview:LHS6];
        
        LHS7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"OneDollarFront.png"]];
        LHS7.center = CGPointMake(67,327);
        LHS7.userInteractionEnabled = NO;
        [subview addSubview:LHS7];
        
        LHS8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        LHS8.center = CGPointMake(163,327);
        LHS8.userInteractionEnabled = NO;
        [subview addSubview:LHS8];
        
        LHS9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        LHS9.center = CGPointMake(291,327);
        LHS9.userInteractionEnabled = NO;
        [subview addSubview:LHS9];
        
        LHS10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS10.center = CGPointMake(67,452);
        LHS10.userInteractionEnabled = NO;
        [subview addSubview:LHS10];
        
        LHS11 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS11.center = CGPointMake(163,452);
        LHS11.userInteractionEnabled = NO;
        [subview addSubview:LHS11];
        
        LHS12 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS12.center = CGPointMake(291,452);
        LHS12.userInteractionEnabled = NO;
        [subview addSubview:LHS12];
        
        LHS13 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        LHS13.center = CGPointMake(67,583);
        LHS13.userInteractionEnabled = NO;
        [subview addSubview:LHS13];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img3.center = CGPointMake(339,753);
        img3.userInteractionEnabled = YES;
        [subview addSubview:img3];
        
        img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwoDollarFront.png"]];
        img4.center = CGPointMake(456,753);
        img4.userInteractionEnabled = YES;
        [subview addSubview:img4];
        
        img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"DimeFront.png"]];
        img5.center = CGPointMake(577,753);
        img5.userInteractionEnabled = YES;
        [subview addSubview:img5];
        
        img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
        img6.center = CGPointMake(689,753);
        img6.userInteractionEnabled = YES;
        [subview addSubview:img6];
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
        img10 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"PennyFront.png"]];
        img10.center = CGPointMake(456,821);
        img10.userInteractionEnabled = YES;
        [subview addSubview:img10];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 14){
        
        req_score = 5000;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS1.center = CGPointMake(163,75);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS2.center = CGPointMake(67,452);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS3.center = CGPointMake(291,583);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
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
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 15){
        
        req_score = 8000;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        LHS1.center = CGPointMake(163,452);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        LHS2.center = CGPointMake(163,198);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        LHS3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        LHS3.center = CGPointMake(163,327);
        LHS3.userInteractionEnabled = NO;
        [subview addSubview:LHS3];
        
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
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiveDollarFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        [self.view addSubview:subview];
    }
    else if(currentLevel == 16){
        
        req_score = 20000;
        
        //LHS
        LHS1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"HundredDollarFront.png"]];
        LHS1.center = CGPointMake(163,327);
        LHS1.userInteractionEnabled = NO;
        [subview addSubview:LHS1];
        
        LHS2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"HundredDollarFront.png"]];
        LHS2.center = CGPointMake(291,327);
        LHS2.userInteractionEnabled = NO;
        [subview addSubview:LHS2];
        
        //RHS
        img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img1.center = CGPointMake(81,753);
        img1.userInteractionEnabled = YES;
        [subview addSubview:img1];
        
        img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
        img2.center = CGPointMake(210,753);
        img2.userInteractionEnabled = YES;
        [subview addSubview:img2];
        
        img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"FiftyDollarFront.png"]];
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
        
        img7 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TwentyDollarFront.png"]];
        img7.center = CGPointMake(81,821);
        img7.userInteractionEnabled = YES;
        [subview addSubview:img7];
        
        img8 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img8.center = CGPointMake(210,821);
        img8.userInteractionEnabled = YES;
        [subview addSubview:img8];
        
        img9 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"TenDollarFront.png"]];
        img9.center = CGPointMake(339,821);
        img9.userInteractionEnabled = YES;
        [subview addSubview:img9];
        
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

    
    //Scoring (Need if block for all levels??
    if (currentLevel == 1){
        
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 5;
        }
    }
    else if(currentLevel == 2){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 5;
        }
    }
    else if(currentLevel == 3){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 25;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 5;
        }
    }
    else if(currentLevel == 4){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 25;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 25;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 25;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 25;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img10.frame, recieve)){
            score = score + 1;
        }
    }
    else if(currentLevel == 5){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 1;
        }
    }
    else if(currentLevel == 6){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 500;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 1;
        }
    }
    else if(currentLevel == 7){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + 5;
        }
    }
    else if(currentLevel == 8){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 100;
        }
    }
    else if(currentLevel == 9){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 1;
        }
    }
    else if(currentLevel == 10){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 5000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 100;
        }
    }
    else if(currentLevel == 11){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 500;
        }
    }
    else if(currentLevel == 12){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 100;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 10;
        }
    }
    else if(currentLevel == 13){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 5000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 500;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 200;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 10;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 5;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + 1;
        }
        if(CGRectIntersectsRect(img10.frame, recieve)){
            score = score + 1;
        }
    }
    else if(currentLevel == 14){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 500;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 500;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 500;
        }
    }
    else if(currentLevel == 15){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 500;
        }
    }
    else if(currentLevel == 16){
        if(CGRectIntersectsRect(img1.frame, recieve)){
            score = score + 5000;
        }
        if(CGRectIntersectsRect(img2.frame, recieve)){
            score = score + 5000;
        }
        if(CGRectIntersectsRect(img3.frame, recieve)){
            score = score + 5000;
        }
        if(CGRectIntersectsRect(img4.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img5.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img6.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img7.frame, recieve)){
            score = score + 2000;
        }
        if(CGRectIntersectsRect(img8.frame, recieve)){
            score = score + 1000;
        }
        if(CGRectIntersectsRect(img9.frame, recieve)){
            score = score + 1000;
        }
    }
    
   
    
    NSLog(@"score = %d", score);
    
    
    if(score == req_score){
        
        score = 0;
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