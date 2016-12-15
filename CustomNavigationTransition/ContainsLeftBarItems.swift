//
//  ContainsLeftBarItems.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/15.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public protocol ContainsLeftBarItems: class {
    var leftBarItems: [UIBarButtonItem]? { get set }
}

extension ContainsLeftBarItems where Self : UIViewController {
    
    @discardableResult
    func addNewLeftbarItem(title: String?, action: Selector?) -> UIBarButtonItem {
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        leftBarItems == nil ? leftBarItems = [item] : leftBarItems?.append(item)
        return item
    }
    
    @discardableResult
    func addNewLeftbarItem(image: UIImage?, action: Selector?) -> UIBarButtonItem {
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
        leftBarItems == nil ? leftBarItems = [item] : leftBarItems?.append(item)
        return item
    }
    
    func setLeftBarButtonItems(_ items: [UIBarButtonItem]?, animated: Bool = false) {
        navigationItem.setLeftBarButtonItems(items, animated: animated)
    }
    
}
