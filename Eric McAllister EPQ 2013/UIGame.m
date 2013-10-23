//
//  UIGame.m
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import "UIGame.h"

@implementation UIGame
@synthesize gameObject1, gameObject2, gameObject3, gameObject4, gameObject5, gameObject6, gameObject7, gameObject8, gameObject9;
@synthesize indicator;
@synthesize title;
-(void)runGame{
    if(self.indicator == 0){
        [self setTitle:@"Organise the shapes alphabetically:"];
    } else if(self.indicator == 1){
        [self setTitle:@"..."];
    } else if(self.indicator == 2){
        [self setTitle:@"???"];
    } else if(self.indicator == 3){
        [self setTitle:@"///"];
    } else if(self.indicator == 4){
        [self setTitle:@">>>"];
    } else if(self.indicator == 5){
        [self setTitle:@"<<<"];
    } else if(self.indicator == 6){
        [self setTitle:@"{{{"];
    } else if(self.indicator == 7){
        [self setTitle:@"}}}"];
    } else if(self.indicator == 8){
        [self setTitle:@"[[["];
    } else if(self.indicator == 9){
        [self setTitle:@"]]]"];
    }
}
@end
