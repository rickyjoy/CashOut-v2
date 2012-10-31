//
//  SimpleCompareVC2.m
//  CashOut
//
//  Created by Tyson Nickel on 2012-10-18.
//  Copyright (c) 2012 Rick. All rights reserved.
//
// Simple Compare Level 1 - Compare a quarter to nickels! (1 quarter from 6 nickels)

#import "SimpleCompareVC2.h"
#import "ImageToDrag.h"

@interface SimpleCompareVC2 ()

@end

//Declare any objects/values here (GLOBAL)
int score;
int req_score;

CGRect recieve;
UIView *recieve_view;
UIView *subview;
UIImageView *LHS;

ImageToDrag *img1;
ImageToDrag *img2;
ImageToDrag *img3;



@implementation SimpleCompareVC2



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    //Create view that will contain dragging area
    
    //To do: create area for reciveiving coins that the user "plays"
    // when coin is dropped into recieve zone, incremement tracker value to that coins value
    // if the tracker value exactly matches the 'required' value, (left side) then the player wins
    // -> push to winning screen, press some acknowledgement to return to level screen
    
    //Image view for currency area
    LHS = [[UIImageView alloc] init];
    [LHS setImage:[UIImage imageNamed:@"DimeFront.png"]];
    req_score = 10;
    
    //Size of currency view area
    [LHS setFrame:CGRectMake(175, 275, 135, 135)];
    [self.view addSubview:LHS];
    
    
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
    
    
    //Create an instance of image to drag
    
    //nickel 1
    img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
    img1.center = CGPointMake(65,740);
    img1.userInteractionEnabled = YES;
    [subview addSubview:img1];
    
    //nickel 2
    img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
    img2.center = CGPointMake(182,740);
    img2.userInteractionEnabled = YES;
    [subview addSubview:img2];
    
    //nickel 3
    img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"NickelFront.png"]];
    img3.center = CGPointMake(299,740);
    img3.userInteractionEnabled = YES;
    [subview addSubview:img3];
    
    [self.view addSubview:subview];
    
    
    
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
    
    //Scoring if-block (sum score)
    if (CGRectIntersectsRect(img1.frame, recieve)) {
        score = score + 5;
    }
    if(CGRectIntersectsRect(img2.frame, recieve)){
        score = score + 5;
    }
    if(CGRectIntersectsRect(img3.frame, recieve)){
        score = score + 5;
    }
    
    NSLog(@"score = %d", score);
    
    
    if(score == req_score){
        
        score = 0;
        //Display "win" alert
        NSLog(@"Winner!");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Correct!" message:@"Level 2 Complete!" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        alert.tag = 100;
        [alert show];
        
        if(alert.tag = 100){
            //Pop back to level screen
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }
    //If incorrect, animate screen to red briefly.
    else if(score != req_score){
        score = 0;
        NSLog(@"No dice!");
        
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
    }
    
    
}

@end