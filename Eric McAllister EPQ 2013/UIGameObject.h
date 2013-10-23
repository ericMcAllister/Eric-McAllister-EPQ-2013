//
//  UIGameObject.h
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGameObject : UIImageView{
    int a;
    int b;
    int c;
    float d;
    float e;
    float f;
}
@property CGPoint *speed, *acceleration, *force;
@property float mass;
@end
