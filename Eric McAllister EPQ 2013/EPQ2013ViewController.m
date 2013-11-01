//
//  EPQ2013ViewController.m
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 25/09/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import "EPQ2013ViewController.h"

@interface EPQ2013ViewController ()

@end

@implementation EPQ2013ViewController
@synthesize countLabel, currentDate, dateLabel;
@synthesize activityTable;
@synthesize hasBeenAveraged;
@synthesize dateTimer;
@synthesize defaults;
@synthesize clicker;
int x = 0;
int dotCount = 0;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return activities.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [activities objectAtIndex:indexPath.row];
    return cell;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------

-(IBAction)clicked{
    count ++;
    currentCount ++;
    [self.defaults setInteger:currentCount forKey:@"Four Day Count"];
    [self.defaults synchronize];
    self.countLabel.text = [NSString stringWithFormat:@"Count: %li", (long)currentCount];
}

-(BOOL)shouldPerformOperationAfterNumberOfDaysPassed:(NSInteger)days fromDate:(NSDate *)initialDate{
    NSDate *nextFireDate = [initialDate dateByAddingDays:days];
    return [nextFireDate isInPast];
}

-(BOOL)yesterdayIs:(NSDate *)yesterday{
    NSDate *today = [yesterday dateByAddingDays:1];
    return [today isInPast];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self setHasBeenAveraged:[self.defaults boolForKey:@"Does the Average exist?"]];
    gameView.game = [[UIGame alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSDate *now = [NSDate date];
    now = [now dateBySubtractingMinutes:now.minute];
    now = [now dateBySubtractingHours:now.hour];
    NSString *stringForNow = [dateFormatter stringFromDate:now];
    if([self.defaults objectForKey:@"Date"] == nil){
        NSLog(@"0");
        currentCount = 0;
        count = 0;
        [self.defaults setInteger:currentCount forKey:@"current count"];
        [self.defaults setInteger:count forKey:@"Four Day Count"];
        [self.defaults setObject:stringForNow forKey:@"Date"];
        [self.defaults setObject:stringForNow forKey:@"Yesterday"];
        [self.defaults setBool:NO forKey:@"Does the Average Exist?"];
        [self.defaults synchronize];
        [self.dateLabel setText:[self.defaults objectForKey:@"Date"]];
        averageLabel.text = [NSString stringWithFormat:@"Your average will appear here."];
    } else{
        if([self yesterdayIs:[dateFormatter dateFromString:[self.defaults objectForKey:@"Yesterday"]]]){
            currentCount = 0;
            [countLabel setText:[NSString stringWithFormat:@"%li", (long)currentCount]];
            [self.defaults setInteger:0 forKey:@"current count"];
            [self.defaults setObject:stringForNow forKey:@"Yesterday"];
            [self.defaults synchronize];
        } else{
            currentCount = [self.defaults integerForKey:@"current count"];
        }
        NSLog(@"1");
        [self.dateLabel setText:[self.defaults objectForKey:@"Date"]];
        count = [self.defaults integerForKey:@"Four Day Count"];
        if([self.defaults integerForKey:@"Average"]){
            NSLog(@"1");
            averageLabel.text = [NSString stringWithFormat:@"Average: %li", (long)[self.defaults integerForKey:@"Average"]];
        } else if([self shouldPerformOperationAfterNumberOfDaysPassed:4 fromDate:[dateFormatter dateFromString:[self.defaults objectForKey:@"Date"]]]){
            NSLog(@"0");
            int average = [self.defaults integerForKey:@"Four Day Count"]/4;
            [self setHasBeenAveraged:YES];
            [self.defaults setInteger:average forKey:@"Average"];
            [self.defaults setBool:YES forKey:@"Does the Average Exist?"];
            [self.defaults synchronize];
            averageLabel.text = [NSString stringWithFormat:@"Average: %i", average];
        } else{
            averageLabel.text = [NSString stringWithFormat:@" "];
        }
    }
    self.dateTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(onTimer)
                                                    userInfo:nil
                                                     repeats:YES];
    activities = [[NSArray alloc]initWithObjects:@"You could go for a walk", @"Learn a new skill", @"Go meet new people", @"Get a hobby", @"Finish some work you need to do", nil];
    if(gameView){
        [runGameButton setEnabled:NO];
        if(![self.defaults integerForKey:@"highscore"]){
            [self.defaults setInteger:0 forKey:@"highscore"];
            [self.defaults synchronize];
            scoreHighscore = 0;
        } else{
            scoreHighscore = [self.defaults integerForKey:@"highscore"];
        }
        score = 0;
        scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        highScoreLabel.text = [NSString stringWithFormat:@"%i", scoreHighscore];
        gameView.game.gameObject1 = [[UIGameObject alloc]init];
        gameView.game.gameObject2 = [[UIGameObject alloc]init];
        gameView.game.gameObject3 = [[UIGameObject alloc]init];
        gameView.game.gameObject4 = [[UIGameObject alloc]init];
        gameView.game.gameObject5 = [[UIGameObject alloc]init];
        gameView.game.gameObject6 = [[UIGameObject alloc]init];
        gameView.game.gameObject7 = [[UIGameObject alloc]init];
        gameView.game.gameObject8 = [[UIGameObject alloc]init];
        gameView.game.gameObject9 = [[UIGameObject alloc]init];
        [gameView addSubview:gameView.game.gameObject1];
        [gameView addSubview:gameView.game.gameObject2];
        [gameView addSubview:gameView.game.gameObject3];
        [gameView addSubview:gameView.game.gameObject4];
        [gameView addSubview:gameView.game.gameObject5];
        [gameView addSubview:gameView.game.gameObject6];
        [gameView addSubview:gameView.game.gameObject7];
        [gameView addSubview:gameView.game.gameObject8];
        [gameView addSubview:gameView.game.gameObject9];
        [self gameChosen:self];
    } else{
        [gameView.gameTimer invalidate];
        score = 0;
        NSLog(@"timer has stopped");
    }
    text.editable = NO;
}

-(void)onTimer{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    self.currentDate.text = [dateFormatter stringFromDate:[NSDate date]];
}

//------------------------------------GAME IMPLEMENTATION--------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------

-(IBAction)gameChosen:(id)sender{
    i = 0;
    [runGameButton setEnabled:NO];
    [gameView setObjectiveAchieved:YES];
    [gameView setHidden:NO];
    gameView.gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                          target:self
                                                        selector:@selector(controlGame)
                                                        userInfo:nil
                                                         repeats:YES];
    NSLog(@"Timer has started");
    declarationLabel.text = gameView.game.title;
}

-(void)controlGame{
    i ++;
    if(i == 12000){
        [gameView setHidden:YES];
        [runGameButton setEnabled:YES];
        [gameView stopRunning];
        score = 0;
        scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        NSLog(@"Timer has stopped");
    }
    if(gameView.objectiveAchieved == YES){
        score ++;
        if(score > scoreHighscore){
            scoreHighscore = score;
        }
        scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        highScoreLabel.text = [NSString stringWithFormat:@"%i", scoreHighscore];
        gameView.objectiveAchieved = NO;
        [gameView startRunning];
        declarationLabel.text = gameView.game.title;
        [self.defaults setInteger:scoreHighscore forKey:@"highscore"];
        [self.defaults synchronize];
    }
    if(gameView.game.indicator == 0){
        [self runGameOne];
    } else if(gameView.game.indicator == 1){
        [self runGameTwo];
    } else if(gameView.game.indicator == 2){
        [self runGameThree];
    } else if(gameView.game.indicator == 3){
        [self runGameFour];
    } else if(gameView.game.indicator == 4){
        [self runGameFive];
    }
}

-(void)runGameOne{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Red Hexagon.png"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Pentagon.png"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Red Square.png"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Red Star.png"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Red Triangle.png"]];
    gameView.game.gameObject7.hidden = YES;
    gameView.game.gameObject8.hidden = YES;
    gameView.game.gameObject9.hidden = YES;
    if(gameView.game.gameObject1.center.x < gameView.game.gameObject2.center.x && gameView.game.gameObject2.center.x < gameView.game.gameObject3.center.x && gameView.game.gameObject3.center.x < gameView.game.gameObject4.center.x && gameView.game.gameObject4.center.x < gameView.game.gameObject5.center.x && gameView.game.gameObject5.center.x < gameView.game.gameObject6.center.x){
        [gameView setObjectiveAchieved:YES];
    }
}

-(void)runGameTwo{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Coloured Rectangle 2.png"]];
    [gameView.game.gameObject1 setFrame:CGRectMake(0, 0, gameView.frame.size.width, 100)];
    if(gameView.game.gameObject9.center.x < (gameView.game.gameObject9.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject9.center.x > gameView.game.gameObject9.a*gameView.frame.size.width/4 && gameView.game.gameObject2.center.x < (gameView.game.gameObject2.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject2.center.x > gameView.game.gameObject2.a*gameView.frame.size.width/4 && gameView.game.gameObject3.center.x < (gameView.game.gameObject3.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject3.center.x > gameView.game.gameObject3.a*gameView.frame.size.width/4 && gameView.game.gameObject4.center.x < (gameView.game.gameObject4.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject4.center.x > gameView.game.gameObject4.a*gameView.frame.size.width/4 && gameView.game.gameObject5.center.x < (gameView.game.gameObject5.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject5.center.x > gameView.game.gameObject5.a*gameView.frame.size.width/4 && gameView.game.gameObject6.center.x < (gameView.game.gameObject6.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject6.center.x > gameView.game.gameObject6.a*gameView.frame.size.width/4 && gameView.game.gameObject7.center.x < (gameView.game.gameObject7.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject7.center.x > gameView.game.gameObject7.a*gameView.frame.size.width/4 && gameView.game.gameObject8.center.x < (gameView.game.gameObject8.a+1)*gameView.frame.size.width/4 && gameView.game.gameObject8.center.x > gameView.game.gameObject8.a*gameView.frame.size.width/4){
        [gameView setObjectiveAchieved:YES];
    }
}

-(void)runGameThree{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Black Circle.png"]];
    if(gameView.j == 1){
        [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 2){
        [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 3){
        [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 4){
        [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 5){
        [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 6){
        [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 7){
        [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 8){
        [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    } else if(gameView.j == 9){
        [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Red Circle.png"]];
    }
}

-(void)runGameFour{
    [self reposition:gameView.game.gameObject1];
    [self reposition:gameView.game.gameObject2];
    [self reposition:gameView.game.gameObject3];
    [self reposition:gameView.game.gameObject4];
    [self reposition:gameView.game.gameObject5];
    [self reposition:gameView.game.gameObject6];
    [self reposition:gameView.game.gameObject7];
    [self reposition:gameView.game.gameObject8];
    if(gameView.game.gameObject1.hidden == YES && gameView.game.gameObject2.hidden == YES && gameView.game.gameObject3.hidden == YES && gameView.game.gameObject4.hidden == YES && gameView.game.gameObject5.hidden == YES && gameView.game.gameObject6.hidden == YES && gameView.game.gameObject7.hidden == YES && gameView.game.gameObject8.hidden == YES){
        [gameView setObjectiveAchieved:YES];
    }
}

-(void)reposition:(UIGameObject *)object{
    object.center = CGPointMake(object.center.x + object.d, object.center.y + object.e);
    if(object.center.x > gameView.frame.size.width - object.frame.size.width/2 || object.center.x < 0 + object.frame.size.width/2){
        object.center = CGPointMake(object.center.x - object.d, object.center.y);
        object.d = -object.d;
    }
    if(object.center.y > gameView.frame.size.height - object.frame.size.height/2 || object.center.y < 0 + object.frame.size.height/2){
        object.center = CGPointMake(object.center.x, object.center.y - object.e);
        object.e = -object.e;
    }
}

-(void)runGameFive{
    gameView.game.gameObject1.frame = CGRectMake(50, 100, 50, 50);
    gameView.game.gameObject2.frame = CGRectMake(200, 100, 50, 50);
    gameView.game.gameObject3.frame = CGRectMake(50, 200, 50, 50);
    gameView.game.gameObject4.frame = CGRectMake(200, 200, 50, 50);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[event allTouches]anyObject];
    if(CGRectContainsPoint(gameView.frame, [myTouch locationInView:self.view])){
        if(CGRectContainsPoint(gameView.game.gameObject1.frame, [myTouch locationInView:gameView])){
            if(gameView.game.indicator != 1){
                x = 1;
            }
        }
        if(CGRectContainsPoint(gameView.game.gameObject2.frame, [myTouch locationInView:gameView])){
            x = 2;
        } else if(CGRectContainsPoint(gameView.game.gameObject3.frame, [myTouch locationInView:gameView])){
            x = 3;
        } else if(CGRectContainsPoint(gameView.game.gameObject4.frame, [myTouch locationInView:gameView])){
            x = 4;
        } else if(CGRectContainsPoint(gameView.game.gameObject5.frame, [myTouch locationInView:gameView])){
            x = 5;
        } else if(CGRectContainsPoint(gameView.game.gameObject6.frame, [myTouch locationInView:gameView])){
            x = 6;
        } else if(CGRectContainsPoint(gameView.game.gameObject7.frame, [myTouch locationInView:gameView])){
            x = 7;
        } else if(CGRectContainsPoint(gameView.game.gameObject8.frame, [myTouch locationInView:gameView])){
            x = 8;
        } else if(CGRectContainsPoint(gameView.game.gameObject9.frame, [myTouch locationInView:gameView])){
            x = 9;
        }
        if(gameView.game.indicator == 2){
            if(x == gameView.j){
                gameView.j = arc4random() % 9;
                gameView.j ++;
                count ++;
                NSLog(@"HIT!");
                if(count >= 20){
                    count = 0;
                    [gameView setObjectiveAchieved:YES];
                }
            }
        } else if(gameView.game.indicator == 3){
            if(CGRectContainsPoint(gameView.game.gameObject1.frame, [myTouch locationInView:gameView])){
                if(gameView.game.gameObject2.hidden == YES && gameView.game.gameObject2.randBool == YES){
                    [gameView.game.gameObject2 setRandBool:NO];
                    [gameView.game.gameObject2 setHidden:NO];
                    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Red Circle.png"]];
                    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Red Circle.png"]];
                    gameView.game.gameObject1.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 25, 25);
                    gameView.game.gameObject2.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 25, 25);
                    gameView.game.gameObject2.d = gameView.game.gameObject1.d;
                    gameView.game.gameObject1.d = -(gameView.game.gameObject1.d);
                    gameView.game.gameObject2.e = -(gameView.game.gameObject1.e);
                } else if(gameView.game.gameObject3.hidden == YES && gameView.game.gameObject3.randBool == YES){
                    [gameView.game.gameObject3 setRandBool:NO];
                    [gameView.game.gameObject3 setHidden:NO];
                    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Blue Circle.png"]];
                    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Blue Circle.png"]];
                    gameView.game.gameObject1.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 20, 20);
                    gameView.game.gameObject3.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 20, 20);
                    gameView.game.gameObject3.d = gameView.game.gameObject1.d;
                    gameView.game.gameObject1.d = -(gameView.game.gameObject1.d);
                    gameView.game.gameObject3.e = -(gameView.game.gameObject1.e);
                } else if(gameView.game.gameObject5.hidden == YES && gameView.game.gameObject5.randBool == YES){
                    [gameView.game.gameObject5 setRandBool:NO];
                    [gameView.game.gameObject5 setHidden:NO];
                    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    gameView.game.gameObject1.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 20, 20);
                    gameView.game.gameObject5.frame = CGRectMake(gameView.game.gameObject1.frame.origin.x, gameView.game.gameObject1.frame.origin.y, 20, 20);
                    gameView.game.gameObject5.d = gameView.game.gameObject1.d;
                    gameView.game.gameObject1.d = -(gameView.game.gameObject1.d);
                    gameView.game.gameObject5.e = -(gameView.game.gameObject1.e);
                } else {
                    [gameView.game.gameObject1 setHidden:YES];
                }
            } else if(CGRectContainsPoint(gameView.game.gameObject2.frame, [myTouch locationInView:gameView])){
                if(gameView.game.gameObject4.hidden == YES && gameView.game.gameObject4.randBool == YES){
                    [gameView.game.gameObject4 setRandBool:NO];
                    [gameView.game.gameObject4 setHidden:NO];
                    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Blue Circle.png"]];
                    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Blue Circle.png"]];
                    gameView.game.gameObject2.frame = CGRectMake(gameView.game.gameObject2.frame.origin.x, gameView.game.gameObject2.frame.origin.y, 20, 20);
                    gameView.game.gameObject4.frame = CGRectMake(gameView.game.gameObject2.frame.origin.x, gameView.game.gameObject2.frame.origin.y, 20, 20);
                    gameView.game.gameObject4.d = gameView.game.gameObject2.d;
                    gameView.game.gameObject2.d = -(gameView.game.gameObject2.d);
                    gameView.game.gameObject4.e = -(gameView.game.gameObject2.e);
                } else if(gameView.game.gameObject6.hidden == YES && gameView.game.gameObject6.randBool == YES){
                    [gameView.game.gameObject6 setRandBool:NO];
                    [gameView.game.gameObject6 setHidden:NO];
                    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    gameView.game.gameObject2.frame = CGRectMake(gameView.game.gameObject2.frame.origin.x, gameView.game.gameObject2.frame.origin.y, 20, 20);
                    gameView.game.gameObject6.frame = CGRectMake(gameView.game.gameObject2.frame.origin.x, gameView.game.gameObject2.frame.origin.y, 20, 20);
                    gameView.game.gameObject6.d = gameView.game.gameObject2.d;
                    gameView.game.gameObject2.d = -(gameView.game.gameObject2.d);
                    gameView.game.gameObject6.e = -(gameView.game.gameObject2.e);
                } else{
                    [gameView.game.gameObject2 setHidden:YES];
                }
            } else if(CGRectContainsPoint(gameView.game.gameObject3.frame, [myTouch locationInView:gameView])){
                if(gameView.game.gameObject7.hidden == YES && gameView.game.gameObject7.randBool == YES){
                    [gameView.game.gameObject7 setRandBool:NO];
                    [gameView.game.gameObject7 setHidden:NO];
                    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    gameView.game.gameObject3.frame = CGRectMake(gameView.game.gameObject3.frame.origin.x, gameView.game.gameObject3.frame.origin.y, 20, 20);
                    gameView.game.gameObject7.frame = CGRectMake(gameView.game.gameObject3.frame.origin.x, gameView.game.gameObject3.frame.origin.y, 20, 20);
                    gameView.game.gameObject7.d = gameView.game.gameObject3.d;
                    gameView.game.gameObject3.d = -(gameView.game.gameObject3.d);
                    gameView.game.gameObject7.e = -(gameView.game.gameObject3.e);
                } else{
                    [gameView.game.gameObject3 setHidden:YES];
                }
            } else if(CGRectContainsPoint(gameView.game.gameObject4.frame, [myTouch locationInView:gameView])){
                if(gameView.game.gameObject8.hidden == YES && gameView.game.gameObject8.randBool == YES){
                    [gameView.game.gameObject8 setRandBool:NO];
                    [gameView.game.gameObject8 setHidden:NO];
                    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Green Circle.png"]];
                    gameView.game.gameObject4.frame = CGRectMake(gameView.game.gameObject4.frame.origin.x, gameView.game.gameObject4.frame.origin.y, 20, 20);
                    gameView.game.gameObject8.frame = CGRectMake(gameView.game.gameObject4.frame.origin.x, gameView.game.gameObject4.frame.origin.y, 20, 20);
                    gameView.game.gameObject8.d = gameView.game.gameObject4.d;
                    gameView.game.gameObject4.d = -(gameView.game.gameObject4.d);
                    gameView.game.gameObject8.e = -(gameView.game.gameObject4.e);
                } else{
                    [gameView.game.gameObject4 setHidden:YES];
                }
            } else if(CGRectContainsPoint(gameView.game.gameObject5.frame, [myTouch locationInView:gameView])){
                [gameView.game.gameObject5 setHidden:YES];
            } else if(CGRectContainsPoint(gameView.game.gameObject6.frame, [myTouch locationInView:gameView])){
                [gameView.game.gameObject6 setHidden:YES];
            } else if(CGRectContainsPoint(gameView.game.gameObject7.frame, [myTouch locationInView:gameView])){
                [gameView.game.gameObject7 setHidden:YES];
            } else if(CGRectContainsPoint(gameView.game.gameObject8.frame, [myTouch locationInView:gameView])){
                [gameView.game.gameObject8 setHidden:YES];
            }
        } else if(gameView.game.indicator == 4){
            if(x == gameView.j){
                [gameView setObjectiveAchieved:YES];
            }
        }
        NSLog(@"%i", x);
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[event allTouches]anyObject];
    if(gameView.game.indicator == 0){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 1){
        if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 2){
    } else if(gameView.game.indicator == 3){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 4){
    } else if(gameView.game.indicator == 5){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
            [gameView setObjectiveAchieved:YES];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 6){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
            [gameView setObjectiveAchieved:YES];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 7){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
            [gameView setObjectiveAchieved:YES];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 8){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
            [gameView setObjectiveAchieved:YES];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else if(gameView.game.indicator == 9){
        if(x==1){
            gameView.game.gameObject1.center = [myTouch locationInView:gameView];
        } else if(x == 2){
            gameView.game.gameObject2.center = [myTouch locationInView:gameView];
        } else if(x == 3){
            gameView.game.gameObject3.center = [myTouch locationInView:gameView];
        } else if(x == 4){
            gameView.game.gameObject4.center = [myTouch locationInView:gameView];
        } else if(x == 5){
            gameView.game.gameObject5.center = [myTouch locationInView:gameView];
        } else if(x == 6){
            gameView.game.gameObject6.center = [myTouch locationInView:gameView];
            [gameView setObjectiveAchieved:YES];
        } else if(x == 7){
            gameView.game.gameObject7.center = [myTouch locationInView:gameView];
        } else if(x == 8){
            gameView.game.gameObject8.center = [myTouch locationInView:gameView];
        } else if(x == 9){
            gameView.game.gameObject9.center = [myTouch locationInView:gameView];
        }
    } else{
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    x = 0;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------
//=======================================END=========================================//

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
