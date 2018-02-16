//
//  UIImage+DHUtils.h
//
//  Created by Dillon on 16/02/2018.
//  Copyright © 2018 8bitDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DHUtils)
- (UIImage *)applyCustomColour:(UIColor *)colour;
- (UIImage *)scaledToSize:(CGSize)newSize;
@end
