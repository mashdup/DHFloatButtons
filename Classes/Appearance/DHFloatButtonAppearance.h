//
//  DHFloatButtonAppearance.h
//  sales-i go
//
//  Created by Dillon on 16/02/2018.
//  Copyright © 2018 sales-i. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DHFloatButtonAppearance : NSObject
@property (nonatomic, strong) UIColor *buttonTint;
@property (nonatomic, strong) UIColor *buttonViewTint;
@property (nonatomic, strong) UIColor *containerViewTint;
@property (nonatomic, strong) UIColor *spotViewTint;
@property (nonatomic, strong) UIColor *fontTint;
@property (nonatomic, assign) CGColorRef shadowTint;
@end
