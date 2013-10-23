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
    self.countLabel.text = [NSString stringWithFormat:@"%i", currentCount];
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
            averageLabel.text = [NSString stringWithFormat:@"%li", (long)[self.defaults integerForKey:@"Average"]];
        } else if([self shouldPerformOperationAfterNumberOfDaysPassed:4 fromDate:[dateFormatter dateFromString:[self.defaults objectForKey:@"Date"]]]){
            NSLog(@"0");
            int average = [self.defaults integerForKey:@"Four Day Count"]/4;
            [self setHasBeenAveraged:YES];
            [self.defaults setInteger:average forKey:@"Average"];
            [self.defaults setBool:YES forKey:@"Does the Average Exist?"];
            [self.defaults synchronize];
            averageLabel.text = [NSString stringWithFormat:@"%i", average];
        } else{
            averageLabel.text = [NSString stringWithFormat:@"Your average will appear here after the first 4 days."];
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
    gameView.gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                          target:self
                                                        selector:@selector(controlGame)
                                                        userInfo:nil
                                                         repeats:YES];
    [gameView startRunning];
    declarationLabel.text = gameView.game.title;
}

-(void)controlGame{
    i ++;
    if(i == 12000){
        [runGameButton setEnabled:YES];
        [gameView stopRunning];
        score = 0;
        scoreLabel.text = [NSString stringWithFormat:@"%i", score];
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
    } else if(gameView.game.indicator == 5){
        [self runGameSix];
    } else if(gameView.game.indicator == 6){
        [self runGameSeven];
    } else if(gameView.game.indicator == 7){
        [self runGameEight];
    } else if(gameView.game.indicator == 8){
        [self runGameNine];
    } else if(gameView.game.indicator == 9){
        [self runGameTen];
    }
}

-(void)runGameOne{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameTwo{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameThree{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameFour{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameFive{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameSix{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameSeven{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameEight{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameNine{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)runGameTen{
    [gameView.game.gameObject1 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject2 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject3 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject4 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject5 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject6 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject7 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject8 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    [gameView.game.gameObject9 setImage:[UIImage imageNamed:@"Rancor.jpg"]];
    gameView.game.gameObject1.center = CGPointMake(200 + 50*sin(0.1*i), 100 + 50*sin(0.1*i));
    gameView.game.gameObject2.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject3.center = CGPointMake(100 + 50*sin(0.1*i), 100 + 50*sin(0.1*i));
    gameView.game.gameObject4.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject5.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject6.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject7.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject8.center = CGPointMake(100, 100 + 50*sin(0.1*i));
    gameView.game.gameObject9.center = CGPointMake(100, 100 + 50*sin(0.1*i));
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *myTouch = [[event allTouches]anyObject];
    if(CGRectContainsPoint(gameView.frame, [myTouch locationInView:self.view])){
        [gameView setObjectiveAchieved:YES];
    }
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
