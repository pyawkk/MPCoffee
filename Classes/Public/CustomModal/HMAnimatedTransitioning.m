//
//  HMAnimatedTransitioning.m
//  05-自定义UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMAnimatedTransitioning.h"
#import "UIView+Extension.h"



const CGFloat duration = 1.0;



@implementation HMAnimatedTransitioning


#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return duration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    if (YES) {
        
        UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *toView = toViewController.view;
        UIView *fromView = fromViewController.view;
//        [[transitionContext containerView] addSubview:toView];
        toView.y = KScreen_height;
//        toViewController.visibleViewController.view.height = KScreen_height + 20;
        
        CGFloat padding = KScreen_height*0.1/2;
        
        [UIView animateWithDuration:.1 animations:^{
            
            toView.transform = CGAffineTransformMakeScale(.9, .9);
            fromView.transform = CGAffineTransformMakeScale(.9, .9);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.8 animations:^{
                
                toView.y = padding;
                fromView.y = - KScreen_height + padding;
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:.1 animations:^{
                    
                    toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                    fromView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                    
                } completion:^(BOOL finished) {
                    
                    toView.transform = CGAffineTransformIdentity;
                    fromView.transform = CGAffineTransformIdentity;
                    [transitionContext completeTransition:YES];
                }];
            }];
        }];
        
        return;
        
//        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
//        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
//        toView.y = toView.height;
//        [UIView animateWithDuration:duration animations:^{
//            toView.y = 0;
//            fromView.y = fromView.height;
//        } completion:^(BOOL finished) {
//            [transitionContext completeTransition:YES];
//        }];
    } else {
        
        UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
        UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
        UIView *toView = toViewController.view;
        UIView *fromView = fromViewController.view;
        toView.y = KScreen_height;
        
        [UIView animateWithDuration:.1 animations:^{
            
            toView.transform = CGAffineTransformMakeScale(.9, .9);
            toView.transform = CGAffineTransformMakeScale(.9, .9);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:.8 animations:^{
                
                toViewController.view.y = 20;
                fromViewController.view.y = - KScreen_height;
                
            } completion:^(BOOL finished) {
                
                [UIView animateWithDuration:.1 animations:^{
                    
                } completion:^(BOOL finished) {
                    
                    //                    fromViewController.view.y = KScreen_height;
                    
                    toViewController.view.transform = CGAffineTransformIdentity;
                    fromViewController.view.transform = CGAffineTransformIdentity;
                    [transitionContext completeTransition:YES];
                }];
            }];
        }];
        return;
        
        [UIView animateWithDuration:duration animations:^{
            UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
            fromView.y = -fromView.height;

        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
