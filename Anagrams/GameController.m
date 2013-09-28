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
    
    // loadint words from anagram
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
            
            [self.gameView addSubview:tileView];
            [tiles addObject:tileView];
        }
    }
}

@end
