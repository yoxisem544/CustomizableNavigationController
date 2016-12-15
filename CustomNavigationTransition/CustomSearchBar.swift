//
//  CustomSearchBar.swift
//  CustomNavigationTransition
//
//  Created by David on 2016/12/15.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit

public protocol CustomSearchBarDelegate: class {
    func customSearchBarFocused()
    func customSearchBarUnfocused()
}

public class CustomSearchBar : UIView {
    
    var searchField: UITextField!
    public weak var delegate: CustomSearchBarDelegate?
    
    // MARK: - Init
    public convenience init() {
        self.init(frame: CGRect.zero)
        configureSearchField()
        backgroundColor = UIColor(hexString: "#f0f0f0")
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSearchField() {
        searchField = UITextField()
        searchField.addTarget(self, action: #selector(CustomSearchBar.editingDidBegin), for: .editingDidBegin)
        searchField.addTarget(self, action: #selector(CustomSearchBar.editingDidEnd), for: .editingDidEnd)
        addSubview(searchField)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        print(bounds)
        searchField.frame = bounds
        searchField.placeholder = "hiiii"
        searchField
            .centerX(inside: self)
            .centerY(inside: self)
    }
    
    @objc private func editingDidBegin() {
        delegate?.customSearchBarFocused()
    }
    
    @objc private func editingDidEnd() {
        delegate?.customSearchBarUnfocused()
    }
    
    public func cancel() {
        searchField.endEditing(true)
    }
    
    public func focus() {
        searchField.becomeFirstResponder()
    }
}
