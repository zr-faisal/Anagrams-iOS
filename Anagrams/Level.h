//
//  Level.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (nonatomic, assign) int pointsPerTitle;
@property (nonatomic, assign) int timeToSolve;
@property (nonatomic, strong) NSArray *anagrams;

//factory method to load a .plist file and initialize the model
+ (instancetype)levelWithNum:(int)levelNum;

@end
