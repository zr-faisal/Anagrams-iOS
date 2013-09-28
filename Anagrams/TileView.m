//
//  TitleView.m
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "TileView.h"

@implementation TileView {
    
    int xOffset, yOffset;
}

- (id)initWithFrame:(CGRect)frame {
    
    NSAssert(NO, @"Use initWithLetter:andSideLength instead");
    return nil;
}

- (instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength {
    
    //the tile background
    UIImage* img = [UIImage imageNamed:@"tile.png"];
    
    //create a new object
    self = [super initWithImage:img];
    
    if (self != nil) {
        
        //3 resize the tile
        float scale = sideLength/img.size.width;
        self.frame = CGRectMake(0,0,img.size.width*scale, img.size.height*scale);
        
        //more initialization here
        UILabel *labelChar = [[UILabel alloc] initWithFrame:self.bounds];
        labelChar.textAlignment = NSTextAlignmentCenter;
        labelChar.textColor = [UIColor whiteColor];
        labelChar.backgroundColor = [UIColor clearColor];
        labelChar.text = [letter uppercaseString];
        labelChar.font = [UIFont fontWithName:@"Verdana-Bold" size:78.0*scale];
        [self addSubview: labelChar];
        
        self.isMatched = NO;
        _letter = letter;
        
        [self setUserInteractionEnabled:YES];
    }
    
    return self;
}

- (void)randomize {
    
    // set random rotation of the tile anywhere between -0.2 and 0.3 radians
    float rotation = arc4random()%50 / (float)100 - 0.2;
    self.transform = CGAffineTransformMakeRotation(rotation);
    
    //move randomly upwards
    int yOff = arc4random()%10 - 10;
    self.center = CGPointMake(self.center.x, self.center.y + yOff);
}

# pragma mark - Dragging the Tile
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"TileView - %@", @"touchesBegan");
    CGPoint point = [[touches anyObject] locationInView:self.superview];
    
    xOffset = point.x - self.center.x;
    yOffset = point.x - self.center.y;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"TileView - %@", @"touchesMoved");
    CGPoint point = [[touches anyObject] locationInView:self.superview];
    
    self.center = CGPointMake(point.x - xOffset, point.y - yOffset);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"TileView - %@", @"touchesEnded");
    [self touchesMoved:touches withEvent:event];
    
    if(self.tileDragDelegate) {
        NSLog(@"TileView - %@", @"Delegate method called!");
        [self.tileDragDelegate tileView:self didDragToPoint:self.center];
    }
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
