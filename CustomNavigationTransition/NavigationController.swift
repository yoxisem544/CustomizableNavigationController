//
//  NavigationController.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/14.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public class NavigationController: UINavigationController {
    
    fileprivate private(set) var interactionController: UIPercentDrivenInteractiveTransition?
    fileprivate private(set) var animator: NavigationAnimator?

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureNavigationBarStyle()
        configureBackButton()
        
        delegate = self
        animator = NavigationAnimator()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(NavigationController.pan(gesture:)))
        
        // adding gesture to navigation controller's view
        // dont add it to self.navigationController.view,
        // cause it will be nil, no parent nav controller
        view.addGestureRecognizer(panGesture)
    }
    
    private func configureNavigationBarStyle() {
        navigationBar.barStyle = .default
//        navigationBar.barTintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.tintColor = UIColor(red: 248/255.0, green: 150/255.0, blue: 128/255.0, alpha: 1)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = .white
        navigationBar.shadowImage = UIImage()
        navigationBar.shadowImage = UIImage.with(color: .cyan)
    }
    
    private func configureBackButton() {
        //        var backButtonBackgroundImage = #imageLiteral(resourceName: "OrangeBackIcon")
        var backButtonBackgroundImage = #imageLiteral(resourceName: "Menu")
        
        let insets = UIEdgeInsets(top: 0,
                                  left: backButtonBackgroundImage.size.width,
                                  bottom: 0,
                                  right: 0)
        backButtonBackgroundImage = backButtonBackgroundImage.resizableImage(withCapInsets: insets)
        
        let appearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationController.self])
        appearance.setBackButtonBackgroundImage(backButtonBackgroundImage, for: .normal, barMetrics: .default)
    }
    
    // MARK: - Gesture
    
    @objc fileprivate func pan(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began {
            let location = gesture.location(in: view)
            if location.x < view.bounds.midX && viewControllers.count > 1 {
                interactionController = UIPercentDrivenInteractiveTransition()
                popViewController(animated: true)
            }
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: view)
            let distanceInPercentage = fabs(translation.x / view.bounds.width)
            interactionController?.update(distanceInPercentage)
        } else {
            if gesture.velocity(in: view).x > 0 {
                // swipe and throw view to right. wanna finish pop
                interactionController?.finish()
            } else {
                // if user stop swiping of swipe left, cancel transition.
                // TODO: check the progress, 0.3 maybe you should also finish transition.
                interactionController?.cancel()
            }
        }
    }

}

extension NavigationController : UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .pop {
            return animator
        }
        return nil
    }
    
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
    
}
