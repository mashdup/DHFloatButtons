//
//  DHFloatButtonAppearance.m
//
//  Created by Dillon on 16/02/2018.
//  Copyright © 2018 8bitDog. All rights reserved.
//

#import "DHFloatButtonAppearance.h"

@implementation DHFloatButtonAppearance
- (id)init {
    if ((self = [super init])) {
        self.buttonTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
        self.buttonViewTint = [UIColor whiteColor];
        self.containerViewTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
        self.spotViewTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
        self.fontTint = [UIColor whiteColor];
        self.shadowTint = [UIColor blackColor].CGColor;
        
    }
    return self;
}
@end
