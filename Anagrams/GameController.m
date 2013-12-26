//
//  GameController.m
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "GameController.h"
#import "TileView.h"
#import "TargetView.h"
#import "config.h"

@implementation GameController

NSMutableArray *tiles;
NSMutableArray *targets;


- (void)dealRandomAnagram {
    
    NSAssert(self.level.anagrams, @"No level loaded!");
    
    // loading random anagrams
    int randomIndex = arc4random()%[self.level.anagrams count];
    NSArray* anaPair = self.level.anagrams[randomIndex];
    
    // loading words from anagram
    NSString *randomWord = anaPair[0];
    int lengthRandom = [randomWord length];
    NSLog(@"RandomWord: %@", randomWord);
    NSString *actualWord = anaPair[1];
    int lengthActual = [actualWord length];
    NSLog(@"ActualWord: %@", actualWord);
    
    //calculate the tile size
    float tileSide = ceilf(kScreenWidth*0.9 / (float)MAX(lengthRandom, lengthActual)) - kTileMargin;
    //get the left margin for first tile
    float xOffset = (kScreenWidth - (float)MAX(lengthRandom, lengthActual) * (tileSide + kTileMargin))/2;
    //adjust for tile center (instead of the tile's origin)
    xOffset += tileSide/2;
    
    // initializing targets
    targets = [[NSMutableArray alloc] initWithCapacity:lengthActual];
    
    for(int i=0; i<lengthActual; i++) {
        
        NSString *letter = [actualWord substringWithRange:NSMakeRange(i, 1)];
        
        if(![letter isEqualToString:@" "]) {
            
            TargetView *targetView = [[TargetView alloc] initWithLetter:letter andSideLength:tileSide];
            targetView.center = CGPointMake(xOffset + i*(tileSide + kTileMargin), kScreenHeight/4);
            
            [self.gameView addSubview:targetView];
            [tiles addObject:targetView];
        }
    }
    
    // initializing titles
    tiles = [[NSMutableArray alloc] initWithCapacity:lengthRandom];
    
    for(int i=0; i<lengthRandom; i++) {
        
        NSString *letter = [randomWord substringWithRange:NSMakeRange(i, 1)];
        
        if(![letter isEqualToString:@" "]) {
            
            TileView *tileView = [[TileView alloc] initWithLetter:letter andSideLength:tileSide];
            tileView.center = CGPointMake(xOffset + i*(tileSide + kTileMargin), kScreenHeight/4*3);
            [tileView randomize];
            tileView.tileDragDelegate = self;
            
            [self.gameView addSubview:tileView];
            [tiles addObject:tileView];
        }
    }
}

- (void)placeTile:(TileView *)tileView atTarget:(TargetView *)targetView {
    
    tileView.isMatched = YES;
    targetView.isMatched = YES;
    
    tileView.userInteractionEnabled = NO;
    
    [UIView animateWithDuration:0.35
                          delay:0.00
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                                tileView.center = targetView.center;
                                tileView.transform = CGAffineTransformIdentity;
                        }
                        completion:^(BOOL finished) {
                                targetView.hidden = YES;
                        }
     ];
}

- (void)isGameFinished {
    
    for (TargetView *target in targets) {
        
        if (target.isMatched == NO) {
            return;
        }
    }
    NSLog(@"Game Over!");
}

#pragma mark - TileView Delegate
- (void)tileView:(TileView *)tile didDragToPoint:(CGPoint)point {
    
    TargetView *targetView = nil;
    
    for(TargetView *target in targets) {
        
        if (CGRectContainsPoint(target.frame, point)) {
            
            targetView = target;
            break;
        }
    }
    
    if (targetView != nil) {

        if ([targetView.letter isEqualToString:tile.letter]) {
            
            [self placeTile:tile atTarget:targetView];
            [self isGameFinished];
        }
        else {
            [tile randomize];
            
            [UIView animateWithDuration:0.35
                                  delay:0.00
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 tile.center = CGPointMake(tile.center.x + randomf(-20, 20), tile.center.x + randomf(20, 30));
                             }
                             completion:nil];
        }
    }
}

@end
