//
//  NavigationAnimator.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/14.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public class NavigationAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        transitionContext.containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0.0
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromViewController.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            toViewController.view.alpha = 1.0
        }, completion: { finished in
            fromViewController.view.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
