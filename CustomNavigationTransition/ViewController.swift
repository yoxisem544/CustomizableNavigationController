//
//  ViewController.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/14.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = [UIColor.red, UIColor.green, UIColor.gray].sample()
        
        button = UIButton(type: UIButtonType.system)
        button.frame.size = CGSize(width: 100, height: 30)
        button.setTitle("YA", for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(ViewController.tap), for: UIControlEvents.touchUpInside)
        button.center = view.center
        
        view.addSubview(button)
        
        title = "YAAA"
    }

    func tap() {
        let vc = SecondViewController()
//        asyncPresent(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension Array {
    func sample() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random() / 2) % count
        return self[index]
    }
}
