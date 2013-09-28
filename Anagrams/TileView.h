//
//  TitleView.h
//  Anagrams
//
//  Created by ZR.Faisal on 7/21/13.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TileView;

@protocol TileDragDelegate <NSObject>

- (void)tileView:(TileView *)tile didDragToPoint:(CGPoint)point;

@end


@interface TileView : UIImageView

@property (nonatomic, weak) id<TileDragDelegate> tileDragDelegate;

@property (nonatomic, strong, readonly) NSString *letter;
@property (nonatomic, assign) BOOL isMatched;

- (instancetype)initWithLetter:(NSString*)letter andSideLength:(float)sideLength;
- (void)randomize;

@end
