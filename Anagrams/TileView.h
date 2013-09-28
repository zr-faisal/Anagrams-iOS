//
//  TitleView.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileView : UIImageView

@property (nonatomic, strong, readonly) NSString *letter;
@property (nonatomic, assign) BOOL isMatched;

- (instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;
- (void)randomize;

@end
