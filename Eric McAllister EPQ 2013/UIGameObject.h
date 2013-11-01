//
//  UIGameObject.h
//  Eric McAllister EPQ 2013
//
//  Created by Eric Mcallister on 09/10/2013.
//  Copyright (c) 2013 Eric Mcallister. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGameObject : UIImageView{
}
@property CGPoint *speed;
@property CGPoint *acceleration, *force;
@property float mass, d, e, f;
@property int a, b, c;
@property BOOL randBool;
@end
