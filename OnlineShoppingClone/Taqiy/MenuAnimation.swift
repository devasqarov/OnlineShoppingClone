//
//  MenuAnimation.swift
//  OnlineShoppingClone
//
//  Created by Mukhammadyunus on 2/25/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit
protocol MenuAnimationProtocol {
    func gestureTapped()
}

class MenuAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var isPresent: Bool = true
    var delegate: MenuAnimationProtocol?
    var baseView: UIView?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        let rect = UIScreen.main.bounds
        
        
        if isPresent {
            
            guard let toView = transitionContext.view(forKey: .to) else {return}
            let fromView = transitionContext.viewController(forKey: .from)!.view!
            fromView.layer.shadowOffset = CGSize(width: 0, height: 0)
            fromView.layer.shadowRadius = 16
            fromView.layer.shadowOpacity = 0.6
            fromView.clipsToBounds = false
            toView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            toView.center = fromView.center
            container.addSubview(toView)
            container.addSubview(fromView)
            
            let aView = UIView(frame: CGRect(x: 0, y: 0, width: fromView.frame.width, height: fromView.frame.height))
            aView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8).translatedBy(x: rect.width-60, y: 0)
            aView.backgroundColor = .clear
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
            aView.addGestureRecognizer(gestureRecognizer)
            
            container.addSubview(aView)
            
            
            UIView.animate(withDuration: duration, animations: {
                
                fromView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7).translatedBy(x: rect.width-60, y: 0)
                toView.transform = .identity
             
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        else {
            let toView = transitionContext.viewController(forKey: .to)!.view!
            let fromView = transitionContext.view(forKey: .from)
            
            UIView.animate(withDuration: duration, animations: {
                toView.transform = .identity
                fromView?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }) { (_) in
                transitionContext.completeTransition(true)
                UIApplication.shared.keyWindow!.addSubview(toView)
            }
        }
    }
    
    @objc func viewTapped() {
        delegate?.gestureTapped()
    }
    
    
}
