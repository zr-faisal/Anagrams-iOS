//
//  GameController.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "TileView.h"

@interface GameController : NSObject <TileDragDelegate>

@property (nonatomic, weak) UIView *gameView;
@property (nonatomic, strong) Level *level;

- (void)dealRandomAnagram;

@end
