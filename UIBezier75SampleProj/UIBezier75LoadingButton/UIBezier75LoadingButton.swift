//
//  UIBezier75LoadingButton.swift
//  

import UIKit

class UIBezier75LoadingButton: AnimatedButton {
    
    private var customTitle: String?
    private var customImage: UIImage?
    private var customState: UIControl.State = .normal
    
    private lazy var activityIndicator: UIBezier75ActivityIndicator = {
        let activityIndicator = UIBezier75ActivityIndicator()
        activityIndicator.indicatorColor = self.titleColor(for: .normal)
        activityIndicator.backgroundColor = .clear
        self.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraints([xCenterConstraint, yCenterConstraint])
        return activityIndicator
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        startLoadingAnimation()
    }
    
    public func setCustomTitle(_ title: String?, for state: UIControl.State) {
        self.setTitle(title, for: state)
        self.customTitle = title
        self.customState = state
    }
    
    public func setCustomImage(_ image: UIImage?, for state: UIControl.State) {
        self.setImage(image, for: state)
        self.customImage = image
        self.customState = state
    }
    
    func startLoadingAnimation() {
        backgroundColor = backgroundColor?.withAlphaComponent(alphaFadeValue)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        setTitle("", for: customState)
        setImage(UIImage(), for: customState)
        isEnabled = false
    }
    
    func stopLoadingAnimation() {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        backgroundColor = backgroundColor?.withAlphaComponent(1)
        setTitle(customTitle ?? "", for: customState)
        setImage(customImage ?? UIImage(), for: customState)
        isEnabled = true
    }
}
