//
//  ViewController.m
//  ResizableTextInput
//
//  Created by admin on 18/12/14.
//  Copyright (c) 2014 corsarus. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISlider *fontSizeSlider;
@property (weak, nonatomic) IBOutlet UITextField *textInput;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.fontSizeSlider addTarget:self action:@selector(updateFontSize) forControlEvents:UIControlEventValueChanged];
    
    self.textInput.backgroundColor = [UIColor yellowColor];
    [self.textInput becomeFirstResponder];
}

- (void)updateFontSize
{
    // Memorize the cursor position
    UITextRange *selectedTextRange = self.textInput.selectedTextRange;
    
    // Apply the font change to the existing text
    [self.textInput setSelectedTextRange:[self.textInput textRangeFromPosition:self.textInput.beginningOfDocument toPosition:self.textInput.endOfDocument]];
    NSUInteger newFontSize = (NSUInteger)self.fontSizeSlider.value;
    NSString *currentFontFamily = self.textInput.font.familyName;
    NSLog(@"Font size %d", newFontSize);
    self.textInput.font = [UIFont fontWithName:currentFontFamily size:newFontSize];
    
    // Replace the cursor to its original position
    [self.textInput setSelectedTextRange:selectedTextRange];
    
    // Trigger layout pass to prevent content jumping
    [self.textInput setNeedsLayout];
}

@end
