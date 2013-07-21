//
//  Level.m
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "Level.h"

@implementation Level

+ (instancetype)levelWithNum:(int)levelNum {
    
    // finding .plist file for the level
    NSString *filename = [NSString stringWithFormat:@"level%i.plist", levelNum];
    NSString *levelPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:filename];
    
    // loading .plist file
    NSDictionary *dictLevel = [NSDictionary dictionaryWithContentsOfFile:levelPath];
    // validation check
    NSAssert(dictLevel, @"Level config file not found!");
    
    // creating level
    Level *level = [[Level alloc] init];
    level.pointsPerTitle = [dictLevel[@"pointsPerTile"] integerValue];
    level.anagrams = dictLevel[@"anagrams"];
    level.timeToSolve = [dictLevel[@"timeToSolve"] integerValue];
    
    return level;
}

@end
