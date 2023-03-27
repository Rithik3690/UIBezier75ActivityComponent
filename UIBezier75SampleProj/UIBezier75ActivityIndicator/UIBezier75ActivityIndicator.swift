//
//  UIBezier75ActivityIndicator.swift
//

import UIKit

class UIBezier75ActivityIndicator: UIView {
    
    let shapeLayer = CAShapeLayer()
    var indicatorColor: UIColor? = .darkGray {
        didSet {
            shapeLayer.strokeColor = indicatorColor?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadShapeLayer()
    }
    
    private func loadShapeLayer() {
        shapeLayer.path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2 , y: self.frame.size.height/2), radius: 10, startAngle: -Double.pi/2, endAngle: Double.pi, clockwise: true).cgPath
        shapeLayer.strokeColor = indicatorColor?.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2
        layer.addSublayer(shapeLayer)
    }
    
    func startAnimating() {
        isHidden = false
        let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.repeatDuration = Double.infinity
        layer.add(rotation, forKey: nil)
    }
    
    func stopAnimating() {
        layer.removeAllAnimations()
    }
    
}
