//
//  SimpleCompareVC.m
//  CashOut
//
//  Created by Tyson Nickel on 2012-10-18.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "SimpleCompareVC.h"
#import "ImageToDrag.h"

@interface SimpleCompareVC ()

@end

@implementation SimpleCompareVC

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

    
    UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 768, 1024)];
    subview.backgroundColor = [[UIColor darkGrayColor]colorWithAlphaComponent:0.25];
    
    CGRect recieve = CGRectMake(400, 0, 368, 658);
    
    //Create an instance of image to drag
    ImageToDrag *img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"penny.png"]];
    img1.center = CGPointMake(110,75);
    img1.userInteractionEnabled = YES;
    [subview addSubview:img1];
    
    // CGRect img1_col = CGRectMake(img1->x, img1->y, 100, 100);
    
    ImageToDrag *img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"penny.png"]];
    img2.center = CGPointMake(220,150);
    img2.userInteractionEnabled = YES;
    [subview addSubview:img2];
    
    
    [self.view addSubview:subview];

    
    //Test game code. . .
    
    int score = 0;
    
    if (CGRectIntersectsRect(img1.frame, recieve)) {
        score++;
    }
    else if(CGRectIntersectsRect(img2.frame, recieve)){
        score++;
    }
    NSLog(@"score = %d", score);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
