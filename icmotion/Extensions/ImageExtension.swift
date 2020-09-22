//
//  ImageExtension.swift
//  icmotion
//
//  Created by Vladimir on 20.09.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

extension UIImage {
    func rotated(by radians: CGFloat) -> UIImage {
        var newSize = CGRect(origin: .zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
                
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        
        guard let graphicsContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
                
        graphicsContext.translateBy(x: newSize.width/2, y: newSize.height/2)
        graphicsContext.rotate(by: CGFloat(radians))
        
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

        return newImage!
    }
}
