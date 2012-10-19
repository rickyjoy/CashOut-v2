//
//  ImageToDrag.m
//  CashOut
//
//  Created by Tyson Nickel on 2012-10-18.
//  Copyright (c) 2012 Rick. All rights reserved.
//

#import "ImageToDrag.h"

@implementation ImageToDrag


- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    //Get active location upon move
    CGPoint activePoint = [[touches anyObject] locationInView:self];
    
    //Determine new point based on where the touch is now located
    CGPoint newPoint = CGPointMake(self.center.x + (activePoint.x - currentPoint.x),
                                   self.center.y + (activePoint.y - currentPoint.y));
    
    //Make sure to stay within bounds of parent view
    float midPointX = CGRectGetMidX(self.bounds);
    
    //If too far right. . .
    if (newPoint.x > self.superview.bounds.size.width - midPointX)
        newPoint.x = self.superview.bounds.size.width - midPointX;
    //If too far left. . .
    else if (newPoint.x < midPointX)
        newPoint.x = midPointX;
    
    float midPointY = CGRectGetMidY(self.bounds);
    //If too far down. . .
    if (newPoint.y > self.superview.bounds.size.height - midPointY)
        newPoint.y = self.superview.bounds.size.height - midPointY;
    //If too far up. . .
    else if (newPoint.y <midPointY)
        newPoint.y = midPointY;
    
    //Set new center location
    self.center = newPoint;
    
    //Updates with move (next 6 lines)
    float x;
    float y;
    
    x = newPoint.x;
    y = newPoint.y;
    
    NSLog(@"x = %f", x);
    NSLog(@"y = %f", y);

    

}
- (id)initWithImage:(UIImage *)image
{
    
    if(self = [super initWithImage:image])
        self.userInteractionEnabled = YES;
    return self;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
