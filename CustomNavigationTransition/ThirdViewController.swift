//
//  ThirdViewController.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/15.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var button: UIButton!
    var backButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button = UIButton(type: UIButtonType.system)
        button.frame.size = CGSize(width: 100, height: 30)
        button.setTitle("YA", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ThirdViewController.tap), for: UIControlEvents.touchUpInside)
        button.center = view.center
        
        view.addSubview(button)
        view.backgroundColor = UIColor.brown
        
        tranparentBar()
        
        setBackButton(title: "回到3")
    }

    func tap() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
