//
//  MainDragViewController.m
//  dragNcode
//
//  Created by Roger on 3/23/15.
//  Copyright (c) 2015 Roger Zou. All rights reserved.
//

#import "MainDragViewController.h"

@interface MainDragViewController ()

@property (weak, nonatomic) IBOutlet UIButton *codeBlock;
@property (weak, nonatomic) IBOutlet UIButton *funcA;

@property (weak, nonatomic) IBOutlet UIButton *d1;
@property (weak, nonatomic) IBOutlet UIButton *f1;


@end

@implementation MainDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.codeBlock addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [self.codeBlock addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragOutside];
    //[self.codeBlock addTarget:self action:@selector(itEnded) forControlEvents:UIControlEventTouchDragExit];
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
    
    //see if collision with funcA frame. HARDCODED
    if (CGRectIntersectsRect(control.frame, self.funcA.frame)) {
        //intersect
        //NSLog(@"%@", self.funcA.backgroundColor);
        self.funcA.backgroundColor = [UIColor colorWithRed:0.56813 green:0.922376 blue:1 alpha:0.27];
    } else
        self.funcA.backgroundColor = [UIColor whiteColor];
}

- (IBAction)finishedDrag:(UIButton *)sender {
    NSLog(@"I'm an idiot");
    if (CGRectIntersectsRect(sender.frame, self.funcA.frame)){
        sender.hidden = true;
    }
}

- (void)itEnded {
    NSLog(@"Ended I guess?");
    if (CGRectIntersectsRect(self.codeBlock.frame, self.funcA.frame)){
        self.codeBlock.hidden = true;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"this happened");
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
