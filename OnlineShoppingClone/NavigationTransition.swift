//
//  NavigationTransition.swift
//  OnlineShoppingClone
//
//  Created by Nodirbek Asqarov on 2/18/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit


class NavigationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration: Double = 1

    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let container = transitionContext.containerView
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        guard let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        
        
        
        
    }
    
    
    
    
    
}
