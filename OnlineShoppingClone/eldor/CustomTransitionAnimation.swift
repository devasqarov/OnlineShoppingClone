//
//  CustomTransitionAnimation.swift
//  OnlineShoppingClone
//
//  Created by user on 2/14/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

class CustomTransionAnimation : NSObject, UIViewControllerAnimatedTransitioning{
    
    var duration = 0.3
    var fromView: UIView?
    var close = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = fromView else {return}
        
        if !close{
            guard let toView =  transitionContext.view(forKey: .to) else {return}
            
            transitionContext.containerView.addSubview(toView)
            toView.transform = CGAffineTransform(scaleX: fromView.frame.width / toView.frame.width, y: fromView.frame.height / toView.frame.height).translatedBy(x: 0, y: 0 - toView.frame.midY)
            
            UIView.animate(withDuration: duration, animations: {
                toView.transform = .identity
            }) { (_) in
                transitionContext.completeTransition(true)
            }
            print("open", toView)
        }else {
            
            guard let fView =  transitionContext.view(forKey: .from) else {return}
            
            transitionContext.containerView.addSubview(fView)
            UIView.animate(withDuration: duration, animations: {
                fView.transform = CGAffineTransform(scaleX: fromView.frame.width / fView.frame.width, y: fromView.frame.height / fView.frame.height).translatedBy(x: 0, y: 0 - fView.frame.midY)
                fView.alpha = 0.5
            }) { (_) in
                fView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
            
            
            
        }
        
        
    }
}
