//
//  DHFloatButton.h
//
//  Created by Dillon on 16/02/2018.
//  Copyright © 2018 8bitDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHFloatButton : UIViewController
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) UIColor *imageViewBackgroundTint;
@property (nonatomic, strong) UIColor *imageViewTint;
@property (nonatomic, assign) CGColorRef imageViewShadowTint;
@property (nonatomic, strong) UIColor *titleTint;
@property (nonatomic, strong) void(^didPressButton)(DHFloatButton *buttton);
@end
