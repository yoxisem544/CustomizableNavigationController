//
//  ContainsRightBarItems.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/15.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public protocol ContainsRightBarItems: class {
    var rightBarItems: [UIBarButtonItem]? { get set }
}

extension ContainsRightBarItems where Self : UIViewController {
    
    @discardableResult
    func addNewRightbarItem(title: String?, action: Selector) -> UIBarButtonItem {
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        rightBarItems == nil ? rightBarItems = [item] : rightBarItems?.append(item)
        return item
    }
    
    @discardableResult
    func addNewRightbarItem(title: String?) -> UIBarButtonItem {
        let item = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        rightBarItems == nil ? rightBarItems = [item] : rightBarItems?.append(item)
        return item
    }
    
    @discardableResult
    func addNewRightbarItem(image: UIImage?, action: Selector) -> UIBarButtonItem {
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        rightBarItems == nil ? rightBarItems = [item] : rightBarItems?.append(item)
        return item
    }
    
    @discardableResult
    func addNewRightbarItem(image: UIImage?) -> UIBarButtonItem {
        let item = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
        rightBarItems == nil ? rightBarItems = [item] : rightBarItems?.append(item)
        return item
    }
    
    func setRightBarButtonItems(_ items: [UIBarButtonItem]?, animated: Bool = false) {
        navigationItem.setRightBarButtonItems(items, animated: animated)
    }
    
}
