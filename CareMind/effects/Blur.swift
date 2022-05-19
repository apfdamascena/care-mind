//
//  Blur.swift
//  CareMind
//
//  Created by alexdamascena on 18/05/22.
//

import UIKit

class Blur: UIVisualEffectView {
    
    private var theEffect: UIVisualEffect?
    private var customIntensity: CGFloat
    private var animator: UIViewPropertyAnimator?
    
    override init(effect: UIVisualEffect?) {
        theEffect = effect
        customIntensity = 0.2
        super.init(effect: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        animator?.stopAnimation(true)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        effect = nil
        animator?.stopAnimation(true)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
             self.effect = theEffect
        }
        animator?.fractionComplete = customIntensity
    }
    
}
