//
//  UIViewControllerExtensionForNavigationController.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/15.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setBackButton(title: String?, target: Any? = nil, action: Selector? = nil) {
        let backButton = UIBarButtonItem(title: title, style: .plain, target: target, action: action)
        navigationItem.backBarButtonItem = backButton
    }
    
    @discardableResult
    func pop(animated: Bool = true) -> UIViewController? {
        return navigationController?.popViewController(animated: animated)
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func tranparentBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
    }
    
    func whitebar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
    }
    
}
