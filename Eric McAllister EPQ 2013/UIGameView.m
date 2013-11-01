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
@synthesize objectiveAchieved;

-(void)startRunning{
    self.i =  arc4random() % 5;
    self.game.indicator = self.i;
    [self.game runGame];
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
        self.game.gameObject1.frame = CGRectMake(arc4random() % 55, arc4random() % 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(arc4random() % 110, arc4random() % 50, 50, 50);
        self.game.gameObject3.frame = CGRectMake(arc4random() % 110, arc4random() % 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(arc4random() % 165, arc4random() % 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(arc4random() % 55, arc4random() % 150, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, arc4random() % 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(arc4random() % 55,arc4random() %  200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(arc4random() % 110,arc4random() % 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(arc4random() % 165,arc4random() %  200, 50, 50);
    } else if(self.game.indicator == 1){
        self.game.gameObject1.frame = CGRectMake(0, 0, 300, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
        self.game.gameObject2.a = arc4random() % 4;
        [self colourDot:self.game.gameObject2];
        self.game.gameObject3.a = arc4random() % 4;
        [self colourDot:self.game.gameObject3];
        self.game.gameObject4.a = arc4random() % 4;
        [self colourDot:self.game.gameObject4];
        self.game.gameObject5.a = arc4random() % 4;
        [self colourDot:self.game.gameObject5];
        self.game.gameObject6.a = arc4random() % 4;
        [self colourDot:self.game.gameObject6];
        self.game.gameObject7.a = arc4random() % 4;
        [self colourDot:self.game.gameObject7];
        self.game.gameObject8.a = arc4random() % 4;
        [self colourDot:self.game.gameObject8];
        self.game.gameObject9.a = arc4random() % 4;
        [self colourDot:self.game.gameObject9];
    } else if(self.game.indicator == 2){
        self.game.gameObject1.frame = CGRectMake(self.frame.size.width/4 - 25, 50, 50, 50);
        self.game.gameObject2.frame = CGRectMake(self.frame.size.width/2 - 25, 50, 50, 50);
        self.game.gameObject3.frame = CGRectMake(3*self.frame.size.width/4 - 25, 50, 50, 50);
        self.game.gameObject4.frame = CGRectMake(self.frame.size.width/4 - 25, 150, 50, 50);
        self.game.gameObject5.frame = CGRectMake(self.frame.size.width/2 - 25, 150, 50, 50);
        self.game.gameObject6.frame = CGRectMake(3*self.frame.size.width/4 - 25, 150, 50, 50);
        self.game.gameObject7.frame = CGRectMake(self.frame.size.width/4 - 25, 250, 50, 50);
        self.game.gameObject8.frame = CGRectMake(self.frame.size.width/2 - 25, 250, 50, 50);
        self.game.gameObject9.frame = CGRectMake(3*self.frame.size.width/4 - 25, 250, 50, 50);
        self.j = arc4random() % 9;
        self.j ++;
    } else if(self.game.indicator == 3){
        [self.game.gameObject1 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject2 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject3 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject4 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject5 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject6 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject7 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject8 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        [self.game.gameObject9 setImage:[UIImage imageNamed:@"Black Circle.png"]];
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject3.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject4.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject5.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject6.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject7.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject8.frame = CGRectMake(-50, -50, 50, 50);
        self.game.gameObject9.frame = CGRectMake(-50, -50, 50, 50);
        [self.game.gameObject2 setHidden:YES];
        [self.game.gameObject3 setHidden:YES];
        [self.game.gameObject4 setHidden:YES];
        [self.game.gameObject5 setHidden:YES];
        [self.game.gameObject6 setHidden:YES];
        [self.game.gameObject7 setHidden:YES];
        [self.game.gameObject8 setHidden:YES];
        [self.game.gameObject9 setHidden:YES];
        [self.game.gameObject1 setD:2];
        [self.game.gameObject1 setE:2];
        [self.game.gameObject2 setD:0];
        [self.game.gameObject2 setE:0];
        [self.game.gameObject3 setD:0];
        [self.game.gameObject3 setE:0];
        [self.game.gameObject4 setD:0];
        [self.game.gameObject4 setE:0];
        [self.game.gameObject5 setD:0];
        [self.game.gameObject5 setE:0];
        [self.game.gameObject6 setD:0];
        [self.game.gameObject6 setE:0];
        [self.game.gameObject7 setD:0];
        [self.game.gameObject7 setE:0];
        [self.game.gameObject8 setD:0];
        [self.game.gameObject8 setE:0];
        [self.game.gameObject1 setRandBool:NO];
        [self.game.gameObject2 setRandBool:YES];
        [self.game.gameObject3 setRandBool:YES];
        [self.game.gameObject4 setRandBool:YES];
        [self.game.gameObject5 setRandBool:YES];
        [self.game.gameObject6 setRandBool:YES];
        [self.game.gameObject7 setRandBool:YES];
        [self.game.gameObject8 setRandBool:YES];
        [self.game.gameObject9 setRandBool:YES];
    } else if(self.game.indicator == 4){
        self.game.gameObject1.frame = CGRectMake(50, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(200, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(50, 200, 50, 50);
        self.game.gameObject4.frame = CGRectMake(200, 200, 50, 50);
        [self.game.gameObject5 setHidden:YES];
        [self.game.gameObject6 setHidden:YES];
        [self.game.gameObject7 setHidden:YES];
        [self.game.gameObject8 setHidden:YES];
        [self.game.gameObject9 setHidden:YES];
        self.game.gameObject1.a = arc4random() % 4;
        if(self.game.gameObject1.a == 0){
            self.game.gameObject2.a = 0;
            self.game.gameObject3.a = 0;
            self.j = 4;
        } else if(self.game.gameObject1.a == 1){
            self.game.gameObject2.a = 1;
            self.game.gameObject3.a = 1;
            self.game.gameObject4.a = 1;
            for(int i = 0;self.game.gameObject1.a == 1; i ++){
                self.game.gameObject1.a = arc4random() % 4;
            }
            self.j = 1;
        } else if(self.game.gameObject1.a == 2){
            self.game.gameObject4.a = 2;
            self.game.gameObject3.a = 2;
            self.j = 2;
        } else if(self.game.gameObject1.a == 3){
            self.game.gameObject2.a = 3;
            self.game.gameObject4.a = 3;
            self.j = 3;
        }
        self.game.gameObject1.b = arc4random() % 4;
        self.game.gameObject2.b = arc4random() % 4;
        self.game.gameObject3.b = arc4random() % 4;
        self.game.gameObject4.b = arc4random() % 4;
        for(int i = 0; self.game.gameObject2.b == self.game.gameObject1.b; i ++){
            self.game.gameObject2.b = arc4random() % 4;
        }
        for(int i = 0; self.game.gameObject3.b == self.game.gameObject1.b || self.game.gameObject3.b == self.game.gameObject2.b; i ++){
            self.game.gameObject3.b = arc4random() % 4;
        }
        for(int i = 0; self.game.gameObject4.b == self.game.gameObject1.b || self.game.gameObject4.b == self.game.gameObject2.b || self.game.gameObject4.b == self.game.gameObject3.b; i ++){
            self.game.gameObject4.b = arc4random() % 4;
        }
        [self shape:self.game.gameObject1 withInt:self.game.gameObject1.b andOtherInteger:self.game.gameObject1.a];
        [self shape:self.game.gameObject2 withInt:self.game.gameObject2.b andOtherInteger:self.game.gameObject2.a];
        [self shape:self.game.gameObject3 withInt:self.game.gameObject3.b andOtherInteger:self.game.gameObject3.a];
        [self shape:self.game.gameObject4 withInt:self.game.gameObject4.b andOtherInteger:self.game.gameObject4.a];
    } else if(self.game.indicator == 5){
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
    } else if(self.game.indicator == 6){
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
    } else if(self.game.indicator == 7){
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
    } else if(self.game.indicator == 8){
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
    } else if(self.game.indicator == 9){
        self.game.gameObject1.frame = CGRectMake(0, 100, 50, 50);
        self.game.gameObject2.frame = CGRectMake(55, 100, 50, 50);
        self.game.gameObject3.frame = CGRectMake(110, 100, 50, 50);
        self.game.gameObject4.frame = CGRectMake(165, 100, 50, 50);
        self.game.gameObject5.frame = CGRectMake(220, 100, 50, 50);
        self.game.gameObject6.frame = CGRectMake(0, 200, 50, 50);
        self.game.gameObject7.frame = CGRectMake(55, 200, 50, 50);
        self.game.gameObject8.frame = CGRectMake(110, 200, 50, 50);
        self.game.gameObject9.frame = CGRectMake(165, 200, 50, 50);
    }
}

-(void)stopRunning{
    [self.gameTimer invalidate];
    NSLog(@"timer has stopped");
    self.game.gameObject1.hidden = YES;
    self.game.gameObject2.hidden = YES;
    self.game.gameObject3.hidden = YES;
    self.game.gameObject4.hidden = YES;
    self.game.gameObject5.hidden = YES;
    self.game.gameObject6.hidden = YES;
    self.game.gameObject7.hidden = YES;
    self.game.gameObject8.hidden = YES;
    self.game.gameObject9.hidden = YES;
}

-(void)colourDot:(UIGameObject *)gameObject{
    if(gameObject.a == 0){
        [gameObject setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameObject.a == 1){
        [gameObject setImage:[UIImage imageNamed:@"Green Circle.png"]];
    } else if(gameObject.a == 2){
        [gameObject setImage:[UIImage imageNamed:@"Blue Circle.png"]];
    } else if(gameObject.a == 3){
        [gameObject setImage:[UIImage imageNamed:@"Yellow Circle.png"]];
    }
}

-(void)shape:(UIGameObject *)object withInt:(int)integer andOtherInteger:(int)otherInt{
    if(integer == 0){
        if(otherInt == 0){
            [object setImage:[UIImage imageNamed:@"Red Circle.png"]];
        } else if(otherInt == 1){
            [object setImage:[UIImage imageNamed:@"Red Square.png"]];
        } else if(otherInt == 2){
            [object setImage:[UIImage imageNamed:@"Red Triangle.png"]];
        } else if(otherInt == 3){
            [object setImage:[UIImage imageNamed:@"Red Star.png"]];
        }
    } else if(integer == 1){
        if(otherInt == 0){
            [object setImage:[UIImage imageNamed:@"Blue Circle.png"]];
        } else if(otherInt == 1){
            [object setImage:[UIImage imageNamed:@"Blue Square.png"]];
        } else if(otherInt == 2){
            [object setImage:[UIImage imageNamed:@"Blue Triangle.png"]];
        } else if(otherInt == 3){
            [object setImage:[UIImage imageNamed:@"Blue Star.png"]];
        }
    } else if(integer == 2){
        if(otherInt == 0){
            [object setImage:[UIImage imageNamed:@"Green Circle.png"]];
        } else if(otherInt == 1){
            [object setImage:[UIImage imageNamed:@"Green Square.png"]];
        } else if(otherInt == 2){
            [object setImage:[UIImage imageNamed:@"Green Triangle.png"]];
        } else if(otherInt == 3){
            [object setImage:[UIImage imageNamed:@"Green Star.png"]];
        }
    } else if(integer == 3){
        if(otherInt == 0){
            [object setImage:[UIImage imageNamed:@"Yellow Circle.png"]];
        } else if(otherInt == 1){
            [object setImage:[UIImage imageNamed:@"Yellow Square.png"]];
        } else if(otherInt == 2){
            [object setImage:[UIImage imageNamed:@"Yellow Triangle.png"]];
        } else if(otherInt == 3){
            [object setImage:[UIImage imageNamed:@"Yellow Star.png"]];
        }
    }
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
