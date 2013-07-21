//
//  TargetView.m
//  Anagrams
//
//  Created by ZR.Faisal on 7/22/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "TargetView.h"

@implementation TargetView

- (id)initWithFrame:(CGRect)frame
{
    NSAssert(NO, @"Use initWithLetter:andSideLength instead");
    return nil;
}

- (instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength {
    
    //the tile background
    UIImage* img = [UIImage imageNamed:@"slot.png"];
    
    //create a new object
    self = [super initWithImage:img];
    
    if (self != nil) {
        
        self.isMatched = NO;
        
        //3 resize the tile
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        //more initialization here
        _letter = letter;
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
