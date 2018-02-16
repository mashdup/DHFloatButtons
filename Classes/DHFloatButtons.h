//
//  DHFloatButtonsViewController.h
//  sales-i go
//
//  Created by Dillon on 15/02/2018.
//  Copyright © 2018 sales-i. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHFloatButtonAppearance.h"

@interface DHFloatButtonItem : NSObject
@property (nonatomic, strong) UIImage *buttonImage;
@property (nonatomic, strong) NSString *buttonTitle;
@end

@interface DHFloatButtons : UIViewController
@property (nonatomic, strong) DHFloatButtonAppearance *appearance;
@property (nonatomic, strong) void(^didPressButtonItem)(DHFloatButtonItem *item);
+ (DHFloatButtons *)sharedInstance;
- (DHFloatButtons *)showFrom:(UIView *)presentingView withButtons:(NSArray <DHFloatButtonItem *> *)buttonItems numberPerRow:(NSInteger)numberPerRow;
@end
