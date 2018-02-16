//
//  UIImage+DHUtils.h
//  sales-i go
//
//  Created by Dillon on 01/09/2017.
//  Copyright © 2017 sales-i. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DHUtils)
- (UIImage *)applyCustomColour:(UIColor *)colour;
- (UIImage *)scaledToSize:(CGSize)newSize;
@end
