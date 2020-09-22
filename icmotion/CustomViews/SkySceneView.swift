//
//  SkySceneView.swift
//  icmotion
//
//  Created by Vladimir on 21.09.2020.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class SkySceneView: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.createSkyStars()
        self.createSkyComet()
    }
}
    
extension SkySceneView {
    private func createSkyStars() {
        let starEmitter = CAEmitterLayer()

        starEmitter.emitterPosition = CGPoint(x: self.center.x, y: self.center.y)
        starEmitter.emitterShape = .rectangle
        starEmitter.emitterSize = self.bounds.size
        starEmitter.beginTime = CACurrentMediaTime()

        let white = createEmitterStarCell(color: .white)
        let blue = createEmitterStarCell(color: UIColor.ICMotion.cyan)

        starEmitter.emitterCells = [white, blue]

        self.layer.addSublayer(starEmitter)
    }
    
    private func createSkyComet() {
        let skyCometImageView = UIImageView()
        
        self.addSubview(skyCometImageView)
        
        self.animateComet(skyCometImageView)
    }

    private func createEmitterStarCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 10
        cell.lifetime = 7
        cell.lifetimeRange = 2.5
        cell.color = color.cgColor
        cell.emissionRange = CGFloat.pi * 2
        cell.alphaRange = 0.1
        cell.alphaSpeed = -0.2
        cell.zAcceleration = 4
        cell.scale = 0.8
        cell.scaleRange = 0.05
        cell.contents = UIImage(named: "particle_sky_star")!.cgImage
        
        return cell
    }
    
    private func animateComet(_ skyCometImageView: UIImageView) {
        let startY = CGFloat.random(in: self.frame.minY...self.frame.maxY * 0.8)
        let endY = CGFloat.random(in: startY * 1.05...self.frame.maxY)
               
        let longitude = calculateLongitude(
            startPoint: CGPoint(x: self.frame.maxX, y: startY),
            endPoint: CGPoint(x: self.frame.minX, y: endY)
        )
        
        let skyCometImage = UIImage(named: "sky_comet")!.rotated(by: longitude)
        skyCometImageView.image = skyCometImage
        
        skyCometImageView.frame = CGRect(x: self.frame.maxX, y: startY, width: skyCometImage.size.width, height: skyCometImage.size.height)
                
        let duration = Double.random(in: 4...15)
        let delay = Double.random(in: 15...40)
        
        UIView.animate(withDuration: duration, delay: delay, options: [.curveLinear], animations: {
            skyCometImageView.frame.origin.x = self.frame.minX - skyCometImage.size.width
            skyCometImageView.frame.origin.y = endY
        }) { _ in
            self.animateComet(skyCometImageView)
        }
    }
    
    public func calculateLongitude(startPoint: CGPoint, endPoint: CGPoint) -> CGFloat {
        let deltaX = endPoint.x - startPoint.x
        let deltaY = endPoint.y - startPoint.y
        return atan2(deltaY, deltaX)
    }
}
