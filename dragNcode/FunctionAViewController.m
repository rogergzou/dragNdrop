//
//  FunctionAViewController.m
//  dragNcode
//
//  Created by Roger on 3/24/15.
//  Copyright (c) 2015 Roger Zou. All rights reserved.
//

#import "FunctionAViewController.h"

@interface FunctionAViewController ()


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *insertionPoints;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *correctInsertionPoints;
@property (weak, nonatomic) IBOutlet UIButton *codeBlock;


@end

@implementation FunctionAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.codeBlock addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [self.codeBlock addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    UIControl *control = sender;
    
    UITouch *t = [[event allTouches] anyObject];
    CGPoint pPrev = [t previousLocationInView:control];
    CGPoint p = [t locationInView:control];
    
    CGPoint center = control.center;
    center.x += p.x - pPrev.x;
    center.y += p.y - pPrev.y;
    control.center = center;
    
    //see if collision with insertPoint frame. HARDCODED
    for (UIButton *insertPoint in self.insertionPoints) {
        
        if (CGRectIntersectsRect(control.frame, insertPoint.frame)) {
            //intersect
            //NSLog(@"%@", self.funcA.backgroundColor);
            insertPoint.backgroundColor = [UIColor colorWithRed:0.56813 green:0.922376 blue:1 alpha:0.27];
        } else
            insertPoint.backgroundColor = [UIColor whiteColor];
    }
}

- (IBAction)finishedDrag:(UIButton *)sender {
    //NSLog(@"I'm an idiot");
    for (UIButton *insertPoint in self.insertionPoints) {
        if (CGRectIntersectsRect(sender.frame, insertPoint.frame)){
            
            if ([self.correctInsertionPoints containsObject:insertPoint]) {
                [insertPoint setTitle:@"correct!" forState:UIControlStateNormal];
                sender.hidden = true;
            } else {
                [insertPoint setTitle:@"wrong location!" forState:UIControlStateNormal];
            }
        }
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
