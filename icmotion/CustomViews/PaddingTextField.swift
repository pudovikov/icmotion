//
//  PaddingTextField.swift
//  icmotion
//
//  Created by Vladimir on 19.09.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class PaddingTextField: UITextField {
    let padding = UIEdgeInsets(top: 10, left: 7, bottom: 10, right: 7)
        
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
