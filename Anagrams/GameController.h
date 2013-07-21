//
//  GameController.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface GameController : NSObject

@property (nonatomic, weak) UIView *gameView;
@property (nonatomic, strong) Level *level;

- (void)dealRandomAnagram;

@end
