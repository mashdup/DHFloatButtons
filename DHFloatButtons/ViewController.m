//
//  ViewController.m
//  DHFloatButtons
//
//  Created by Dillon on 16/02/2018.
//  Copyright © 2018 8bitDog. All rights reserved.
//

#import "ViewController.h"
#import "DHFloatButtons.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openMenu:(id)sender {
    DHFloatButtonItem *button = [DHFloatButtonItem new];
    button.buttonImage = [UIImage imageNamed:@"favouriteIcon"];
    button.buttonTitle = @"Button 1";
    DHFloatButtonItem *button2 = [DHFloatButtonItem new];
    button2.buttonImage = [UIImage imageNamed:@"favouriteIcon"];
    button2.buttonTitle = @"Button 2";
    DHFloatButtonItem *button3 = [DHFloatButtonItem new];
    button3.buttonImage = [UIImage imageNamed:@"favouriteIcon"];
    button3.buttonTitle = @"Button 3";
    
    DHFloatButtons *buttons = [DHFloatButtons sharedInstance];
    buttons.appearance.buttonTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
    buttons.appearance.buttonViewTint = [UIColor whiteColor];
    buttons.appearance.containerViewTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
    buttons.appearance.spotViewTint = [UIColor colorWithRed:55./255. green:66./255. blue:77./255. alpha:1.];
    buttons.appearance.fontTint = [UIColor whiteColor];
    buttons.appearance.shadowTint = [UIColor blackColor].CGColor;
    [buttons setDidPressButtonItem:^(DHFloatButtonItem *item) {
        if (button == item) {
            NSLog(@"Pressed Button 1");
        }
        if (button2 == item) {
            NSLog(@"Pressed Button 2");
        }
        if (button3 == item) {
            NSLog(@"Pressed Button 3");
        }
    }];
    
    [buttons showFrom:sender withButtons:@[button,button2,button3] numberPerRow:3];
}

@end
