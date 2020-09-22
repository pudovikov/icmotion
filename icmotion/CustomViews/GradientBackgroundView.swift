//
//  GradientBackgroundView.swift
//  icmotion
//
//  Created by Vladimir on 19.09.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class GradientBackgroundView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        gradientLayer.colors = [UIColor.ICMotion.blue.cgColor, UIColor.ICMotion.cyan.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        
        self.layer.addSublayer(gradientLayer)
    }
}
