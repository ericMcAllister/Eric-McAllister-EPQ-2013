//
//  UIGameView.m
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import "UIGameView.h"

@implementation UIGameView
@synthesize gameTimer;
@synthesize game;

-(void)startRunning{
    self.i =  arc4random() % 10;
    self.game.indicator = self.i;
    [self.game runGame];
    j = self.i;
    self.game.gameObject1.hidden = NO;
    self.game.gameObject2.hidden = NO;
    self.game.gameObject3.hidden = NO;
    self.game.gameObject4.hidden = NO;
    self.game.gameObject5.hidden = NO;
    self.game.gameObject6.hidden = NO;
    self.game.gameObject7.hidden = NO;
    self.game.gameObject8.hidden = NO;
    self.game.gameObject9.hidden = NO;
    if(self.game.indicator == 0){
        self.game.gameObject1.hidden = NO;
        self.game.gameObject2.hidden = NO;
        self.game.gameObject3.hidden = NO;
        self.game.gameObject4.hidden = NO;
        self.game.gameObject5.hidden = NO;
        self.game.gameObject6.hidden = NO;
        self.game.gameObject7.hidden = NO;
        self.game.gameObject8.hidden = NO;
        self.game.gameObject9.hidden = NO;
        self.game.gameObject1.frame = CGRectMake(0, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(0, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(0, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 1){
        self.game.gameObject1.frame = CGRectMake(10, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(10, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(10, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 2){
        self.game.gameObject1.frame = CGRectMake(20, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(20, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(20, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 3){
        self.game.gameObject1.frame = CGRectMake(30, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(30, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(30, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 4){
        self.game.gameObject1.frame = CGRectMake(40, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(40, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(40, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 5){
        self.game.gameObject1.frame = CGRectMake(50, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(50, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(50, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 6){
        self.game.gameObject1.frame = CGRectMake(60, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(60, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(60, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 7){
        self.game.gameObject1.frame = CGRectMake(70, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(70, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(70, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 8){
        self.game.gameObject1.frame = CGRectMake(80, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(80, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(80, arc4random() % 100, 40, 40);
    } else if(self.game.indicator == 9){
        self.game.gameObject1.frame = CGRectMake(90, 0, 40, 40);
        self.game.gameObject2.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject3.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject4.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject5.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject6.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject7.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject8.frame = CGRectMake(90, arc4random() % 100, 40, 40);
        self.game.gameObject9.frame = CGRectMake(90, arc4random() % 100, 40, 40);
    }
}

-(void)stopRunning{
    self.game.gameObject1.hidden = YES;
    self.game.gameObject2.hidden = YES;
    self.game.gameObject3.hidden = YES;
    self.game.gameObject4.hidden = YES;
    self.game.gameObject5.hidden = YES;
    self.game.gameObject6.hidden = YES;
    self.game.gameObject7.hidden = YES;
    self.game.gameObject8.hidden = YES;
    self.game.gameObject9.hidden = YES;
    [self.gameTimer invalidate];
    NSLog(@"timer has stopped");
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
