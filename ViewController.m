//
//  ViewController.m
//  MPCoffee
//
//  Created by 潘勇 on 2017/5/27.
//  Copyright © 2017年 gtfx. All rights reserved.
//

#import "ViewController.h"
#import "HMTransition.h"
#import "MPRootViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)skipBtnClick:(id)sender {
    MPRootViewController *homeNavC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"MPRootViewController"];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:profile];
    homeNavC.modalPresentationStyle = UIModalPresentationCustom;
    homeNavC.transitioningDelegate = [HMTransition sharedtransition];
    
    [self presentViewController:homeNavC animated:YES completion:^{
               NSLog(@"弹出一个模态窗口");
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
