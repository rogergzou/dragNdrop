//
//  WriteCodeViewController.m
//  dragNcode
//
//  Created by Roger on 3/24/15.
//  Copyright (c) 2015 Roger Zou. All rights reserved.
//

#import "WriteCodeViewController.h"
#import "MainDragViewController.h"

@interface WriteCodeViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *codeTextView;

@end

@implementation WriteCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if (textView == self.codeTextView) {
        NSLog(@"yup");
        if ([textView.text isEqualToString:@"Tap here to write code"]) {
            textView.text = @"";
        }
    }
    return true;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *nextVC = [segue destinationViewController];
    if ([nextVC isKindOfClass:[MainDragViewController class]]) {
        MainDragViewController *maindragVC = (MainDragViewController *)nextVC;
        maindragVC.codeBlockString = self.codeTextView.text;
    }
}


@end
