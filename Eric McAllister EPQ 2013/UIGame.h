//
//  UIGame.h
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIGameObject.h"

@interface UIGame : NSString
@property int indicator;
@property (retain) NSString *title;
@property (nonatomic, retain) IBOutlet UIGameObject *gameObject1, *gameObject2, *gameObject3, *gameObject4, *gameObject5, *gameObject6, *gameObject7, *gameObject8, *gameObject9;
-(void)runGame;
@end
