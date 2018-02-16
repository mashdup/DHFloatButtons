DHFloatButtons
==============

Easy floating button menu with customisable colours
--------------

Easy to use menu system that will pop up a bunch of buttons with a basic block function.

Appearance can be changed at run time by setting the appearance object.

Pass in an array of **DHFloatButtonItem** and the block function of **setDidPressButtonItem** will return any item that was pressed.

The maximum buttons in a row is easily set using the show method **showFrom:withButtons:numberPerRow:**

Usage
--------------

  ```objective-c
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
    ```

Licence
-----------
Copyright 2018 Dillon Hoa

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
