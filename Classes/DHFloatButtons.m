//
//  DHFloatButtonsViewController.m
//  sales-i go
//
//  Created by Dillon on 15/02/2018.
//  Copyright © 2018 sales-i. All rights reserved.
//

#import "DHFloatButtons.h"
#import "DHFloatButton.h"

#define kPadding 10

@interface DHFloatButtonItem ()
@end

@implementation DHFloatButtonItem

@end

static DHFloatButtons *sharedInstance;

@interface DHFloatButtons ()
@property (nonatomic, strong) IBOutlet UIView *buttonsView;
@property (nonatomic, strong) IBOutlet UIView *spotView;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *spotTopConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *spotLeftConstraint;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *cardTopConstraint;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *widthConstraint;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *heightConstraint;
@property (nonatomic, strong) UIView *presentingView;
@property (nonatomic, strong) NSMutableArray <DHFloatButton *> *buttons;
@property (nonatomic, strong) NSArray <DHFloatButtonItem *> *items;

@property (nonatomic, assign) NSInteger numberPerRow;
@end

@implementation DHFloatButtons

+ (DHFloatButtons *)sharedInstance {
    if (!sharedInstance){
        sharedInstance = [DHFloatButtons new];
        sharedInstance.buttons = [NSMutableArray array];
        sharedInstance.numberPerRow =1;
        sharedInstance.appearance = [DHFloatButtonAppearance new];
    }
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _buttonsView.layer.cornerRadius = 10.;
    _buttonsView.layer.shadowRadius = 3.;
    _buttonsView.layer.shadowOffset = CGSizeMake(2., 2.);
    _buttonsView.layer.shadowOpacity = 0.3;
    
    _spotView.layer.cornerRadius = _spotView.bounds.size.height/2;
    _spotView.layer.shadowRadius = 3.;
    _spotView.layer.shadowOffset = CGSizeMake(2., 2.);
    _spotView.layer.shadowOpacity = 0.3;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _buttonsView.backgroundColor = _appearance.containerViewTint;
    _spotView.backgroundColor = _appearance.spotViewTint;
    _buttonsView.layer.shadowColor = _appearance.shadowTint;
    _spotView.layer.shadowColor = _appearance.shadowTint;
}

- (void)viewDidLayoutSubviews {
    CGPoint presentingPoint = [_presentingView.superview convertPoint:_presentingView.frame.origin toView:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    
    _spotTopConstraint.constant = presentingPoint.y + _presentingView.bounds.size.height/2;
    _spotLeftConstraint.constant = presentingPoint.x + _presentingView.bounds.size.width/2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (presentingPoint.y + _presentingView.bounds.size.height/2 + _spotView.bounds.size.height/2 + 18 + _buttonsView.bounds.size.height +20 > self.view.bounds.size.height) {
            _cardTopConstraint.constant = -_spotView.bounds.size.height - _buttonsView.bounds.size.height-18;
        } else {
            _cardTopConstraint.constant = 18;
        }
    });
    
    DHFloatButton *button = _buttons.firstObject;
    
    if (button) {
        NSInteger rows = ceilf((float)_buttons.count/(float)_numberPerRow);
        NSInteger columns = _buttons.count > _numberPerRow ? _numberPerRow: _buttons.count;
        _widthConstraint.constant = columns * button.view.bounds.size.width;
        _heightConstraint.constant = rows * button.view.bounds.size.height;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_buttons enumerateObjectsUsingBlock:^(DHFloatButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSInteger column = idx;
            NSInteger row = 0;
            while (column > _numberPerRow-1) {
                column -=_numberPerRow;
                row++;
            }
            obj.view.frame = CGRectMake(column *obj.view.bounds.size.width, row*obj.view.bounds.size.height, obj.view.bounds.size.width, obj.view.bounds.size.height);
        }];
    });
    
    
}

- (void)setButtons:(NSMutableArray<DHFloatButton *> *)buttons {
    _buttons = buttons;
    [_buttons enumerateObjectsUsingBlock:^(DHFloatButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setDidPressButton:^(DHFloatButton *buttton) {
            [self didPressIndex:idx];
        }];
        [_buttonsView addSubview:obj.view];
    }];
    
    [self.view setNeedsLayout];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects.firstObject;
    UIView *view = [self.view hitTest:[touch locationInView:self.view] withEvent:event];
    if (view == self.view){
        [self dismiss];
    }
}

- (void)didPressIndex:(NSInteger)index {
    if (_didPressButtonItem) _didPressButtonItem(_items[index]);
    [self dismiss];
}

- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 0.;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

- (DHFloatButtons *)showFrom:(UIView *)presentingView withButtons:(NSArray <DHFloatButtonItem *> *)buttonItems numberPerRow:(NSInteger)numberPerRow{
    if (numberPerRow < 1) numberPerRow = 1;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    DHFloatButtons *buttons = self;
    buttons.numberPerRow = numberPerRow;
    buttons.view.frame = window.bounds;
    buttons.items = buttonItems;
    buttons.presentingView = presentingView;
    buttons.view.alpha = 1.;
    [buttons.buttonsView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    buttons.buttons = nil;
    NSMutableArray *newButtons = [NSMutableArray arrayWithCapacity:buttonItems.count];
    [buttonItems enumerateObjectsUsingBlock:^(DHFloatButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DHFloatButton *button = [DHFloatButton new];
        button.image = obj.buttonImage;
        button.titleString = obj.buttonTitle;
        button.imageViewTint = buttons.appearance.buttonTint;
        button.imageViewShadowTint = buttons.appearance.shadowTint;
        button.imageViewBackgroundTint = buttons.appearance.buttonViewTint;
        button.titleTint = buttons.appearance.fontTint;
        [newButtons addObject:button];
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        buttons.buttons = newButtons;
        buttons.view.alpha = 0.;
        
        buttons.spotView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        
        buttons.buttonsView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0, 0);
        [window addSubview:buttons.view];
        buttons.buttonsView.alpha = 0.;
        [UIView animateWithDuration:0.3 animations:^{
            
            buttons.spotView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
            buttons.view.alpha = 1.;
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                buttons.buttonsView.alpha = 1.;
                buttons.buttonsView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                
            }];
        }];
    });
    
    
    return buttons;
}

@end
