//
//  EPQ2013ViewController.h
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 25/09/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGameView.h"
#import "NSDate-Utilities.h"

@interface EPQ2013ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSInteger count;
    NSInteger currentCount;
    NSArray *activities;
    int i;
    int score;
    int scoreHighscore;
    IBOutlet UILabel *declarationLabel;
    IBOutlet UILabel *averageLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *highScoreLabel;
    IBOutlet UIGameView *gameView;
    IBOutlet UIButton *runGameButton;
    IBOutlet UITextView *text;
    
}
@property BOOL hasBeenAveraged;
@property IBOutlet UILabel *countLabel, *currentDate, *dateLabel;
@property IBOutlet UITableView *activityTable;
@property IBOutlet UIButton *clicker;
@property NSUserDefaults *defaults;
@property NSTimer *dateTimer;
@property IBOutlet UITabBarItem *loadgameView;
-(IBAction)clicked;
-(IBAction)gameChosen:(id)sender;
@end
