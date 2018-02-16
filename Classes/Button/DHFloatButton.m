//
//  DHFloatButton.m
//  sales-i go
//
//  Created by Dillon on 15/02/2018.
//  Copyright © 2018 sales-i. All rights reserved.
//

#import "DHFloatButton.h"
#import "UIImage+DHUtils.h"

@interface DHFloatButton ()
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;

@end

@implementation DHFloatButton

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.layer.cornerRadius = _imageView.bounds.size.width/2;
    _imageView.layer.shadowRadius = 3.;
    _imageView.layer.shadowOffset = CGSizeMake(2., 2.);
    _imageView.layer.shadowOpacity = 0.3;
    
    _titleLabel.text = _titleString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.layer.shadowColor = _imageViewShadowTint;
        _titleLabel.textColor = _titleTint;
        _imageView.layer.cornerRadius = _imageView.bounds.size.width/2;
        _imageView.image = [_image scaledToSize:CGSizeMake(_imageView.bounds.size.width*0.6, _imageView.bounds.size.height*0.6)];
        _imageView.image = [_imageView.image applyCustomColour:_imageViewTint];
        _imageView.backgroundColor = _imageViewBackgroundTint;
        _imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
        [UIView animateWithDuration:0.2 delay:0.4 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            _imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                _imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            }];
        }];
    });
}

- (IBAction)didPressButton:(id)sender {
    if (_didPressButton) _didPressButton(self);
}

@end
