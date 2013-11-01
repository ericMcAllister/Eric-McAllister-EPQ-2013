//
//  UIGameView.h
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGame.h"

@interface UIGameView : UIView{
}
@property int i, j;
@property (nonatomic, retain) UIGame *game;
@property NSTimer *gameTimer;
@property BOOL objectiveAchieved;
@property NSString *declaration;
-(void)stopRunning;
-(void)startRunning;
@end
