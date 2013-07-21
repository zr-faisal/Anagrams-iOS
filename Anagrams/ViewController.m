//
//  ViewController.m
//  Anagrams
//
//  Created by Marin Todorov on 16/02/2013.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

#import "config.h"
#import "ViewController.h"
#import "Level.h"
#import "GameController.h"

@interface ViewController ()

@property (nonatomic, strong) GameController *gameController;

@end

@implementation ViewController

// new initializer method
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if(self != nil) {
        
        self.gameController = [[GameController alloc] init];
    }
    
    return self;
}

//setup the view and instantiate the game controller
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Level *leve1 = [Level levelWithNum:1];
    NSLog(@"Level-1: %@", leve1.anagrams);
    
    // adding a layer for all game elements
    UIView *gameLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:gameLayer];
    
    self.gameController.gameView = gameLayer;
    
    self.gameController.level = leve1;
    [self.gameController dealRandomAnagram];
}

@end
