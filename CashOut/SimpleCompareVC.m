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
    
    //nickel 1
    ImageToDrag *img1 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img1.center = CGPointMake(500,400);
    img1.userInteractionEnabled = YES;
    [subview addSubview:img1];
    
    //nickel 2
    ImageToDrag *img2 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img2.center = CGPointMake(500,450);
    img2.userInteractionEnabled = YES;
    [subview addSubview:img2];
    
    //nickel 3
    ImageToDrag *img3 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img3.center = CGPointMake(500,450);
    img3.userInteractionEnabled = YES;
    [subview addSubview:img3];
    
    //nickel 4
    ImageToDrag *img4 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img4.center = CGPointMake(500,450);
    img4.userInteractionEnabled = YES;
    [subview addSubview:img4];
    
    //nickel 5
    ImageToDrag *img5 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img5.center = CGPointMake(500,450);
    img5.userInteractionEnabled = YES;
    [subview addSubview:img5];
    
    //nickel 6
    ImageToDrag *img6 = [[ImageToDrag alloc] initWithImage:[UIImage imageNamed:@"nickel.png"]];
    img6.center = CGPointMake(500,450);
    img6.userInteractionEnabled = YES;
    [subview addSubview:img6];
    [self.view addSubview:subview];

    
    //Test game code. . .
    
    int score = 0;
    
    if (CGRectIntersectsRect(img1.frame, recieve)) {
        score++;
    }
    if(CGRectIntersectsRect(img2.frame, recieve)){
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
