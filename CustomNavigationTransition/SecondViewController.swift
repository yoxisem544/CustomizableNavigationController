//
//  SecondViewController.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/14.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, ContainsLeftBarItems, ContainsRightBarItems {
    
    let search = CustomSearchBar()
    var leftBarItems: [UIBarButtonItem]?
    var rightBarItems: [UIBarButtonItem]?
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        
        // Do any additional setup after loading the view.
        button = UIButton(type: UIButtonType.system)
        button.frame.size = CGSize(width: 100, height: 30)
        button.setTitle("YA", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(SecondViewController.tap), for: UIControlEvents.touchUpInside)
        button.center = view.center
        
        view.addSubview(button)
        
        
        view.backgroundColor = .black
        
        print("init search")
        
        search.delegate = self
        search.autoresizingMask = .flexibleWidth
        search.frame.size.height = 30
        search.frame.size.width = 400
        print("before")
        navigationItem.titleView = search
        print("after")
        
        let backButton = addNewLeftbarItem(image: #imageLiteral(resourceName: "OrangeBackIcon"), action: #selector(SecondViewController.clicked(item:)))
        backButton.imageInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: -40)
        addNewLeftbarItem(image: #imageLiteral(resourceName: "OrangeSearchButton"), action: #selector(SecondViewController.clicked(item:))).imageInsets.left = -8
        setLeftBarButtonItems(leftBarItems)
        
        addNewRightbarItem(title: " 搜尋", action: #selector(SecondViewController.clicked(item:)))
        setRightBarButtonItems(rightBarItems)
    }
    
    @objc fileprivate func cancelButtonClicked() {
        search.cancel()
    }
    
    func clicked(item: UIBarButtonItem) {
        if item.image == #imageLiteral(resourceName: "OrangeBackIcon") {
            print("back")
            pop()
        } else if item.image == #imageLiteral(resourceName: "OrangeSearchButton") {
            print("search")
            search.focus()
        }
    }
    
    func tap() {
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension SecondViewController : CustomSearchBarDelegate {
    
    func customSearchBarFocused() {

    }
    
    func customSearchBarUnfocused() {
        
    }
    
}
