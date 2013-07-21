//
//  TargetView.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/22/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TargetView : UIImageView

@property (nonatomic, strong, readonly) NSString *letter;
@property (nonatomic, assign) BOOL isMatched;

- (instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;

@end
