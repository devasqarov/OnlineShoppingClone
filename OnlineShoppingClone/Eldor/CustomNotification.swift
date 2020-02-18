//
//  CustomNotification.swift
//  OnlineShoppingClone
//
//  Created by user on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

/*
 To use
 
 CustomNotification.getInstance().setUp(title: "Some title", notificationType: .succes)
 
 */

class CustomNotification: NSObject{
    
    private var notifyView : UIView!
    private var duration = 0.5
    private var delay_duration = 2.0
    private let NOTIFY_HEIGHT : CGFloat = 60
    private var isShow : Bool = false
    
    
    enum NotificationType {
        case error
        case succes
        case warning
        case unknown
    }
    
    static func getInstance() -> CustomNotification {
        return CustomNotification()
    }
    
    func setUp(title: String, notificationType: NotificationType){
        guard let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window else {return}
        
        setUpView(window: window, title: title)
        setNotifyType(with: notificationType)
        showNotify()
        
    }
    
   private func setUpView(window: UIWindow, title: String){
        notifyView = UIView(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: NOTIFY_HEIGHT))
        
        let label = UILabel(frame: CGRect(x: 10, y: 10, width: window.frame.width - 40, height: NOTIFY_HEIGHT - 20))
        label.text = title
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: window.frame.width, height: self.notifyView.frame.height))
        button.addTarget(self, action: #selector(cancelPressedDragInside), for: .touchDragInside)
        button.addTarget(self, action: #selector(cancelPressedUpinside), for: .touchUpInside)
        
        notifyView.addSubview(label)
        notifyView.addSubview(button)
        window.addSubview(notifyView)
    }
    
    private func setNotifyType(with notificationType: NotificationType){
        
        switch notificationType {
        case .error:
            notifyView.backgroundColor = .red
        case .succes:
            notifyView.backgroundColor = .green
        case .warning:
            notifyView.backgroundColor = .yellow
        case .unknown:
            notifyView.backgroundColor = .gray
        }
    }
    
    private func showNotify(){
        notifyView.transform = CGAffineTransform(translationX: 0, y: -notifyView.frame.height)
        
        UIView.animate(withDuration: duration, animations: {
            self.notifyView.transform = .identity
        }) { (_) in
            self.cancelNotify()
        }
    }
    
    private func cancelNotify(){
        DispatchQueue.main.asyncAfter(deadline: .now() + delay_duration) {
            self.cancelNotifyUpInSide()
        }
    }
    
    // MARK: - Button Selector Functions
    
    @objc func cancelPressedDragInside(){
        cancelNotifyDragInside()
    }
    
    @objc func cancelPressedDragOutside(){
        cancelNotifyDragOutside()
    }
    
    @objc func cancelPressedUpinside(){
        cancelNotifyUpInSide()
    }
    
    @objc func cancelPressedDragExit(){
        cancelNotifyDragExit()
    }
    
    // MARK: - Animation Cancel Notifications
    private func cancelNotifyDragInside(){
        
        UIView.animate(withDuration: duration, animations: {
            self.notifyView.transform = CGAffineTransform(translationX: -self.notifyView.frame.width, y: 0)
        }) { (_) in
            self.removeNotifySuperView()
        }
    }
    
    private func cancelNotifyDragOutside(){
        
        UIView.animate(withDuration: duration, animations: {
            self.notifyView.transform = CGAffineTransform(translationX: 0, y: -self.notifyView.frame.height)
        }) { (_) in
            self.removeNotifySuperView()
        }
    }
    
    private func cancelNotifyUpInSide(){
        
        UIView.animate(withDuration: duration, animations: {
            self.notifyView.transform = CGAffineTransform(translationX: 0, y: -self.notifyView.frame.height)
        }) { (_) in
            self.removeNotifySuperView()
        }
    }
    
    private func cancelNotifyDragExit(){
        
        UIView.animate(withDuration: duration, animations: {
            self.notifyView.transform = CGAffineTransform(translationX: 0, y: -self.notifyView.frame.height)
        }) { (_) in
            self.removeNotifySuperView()
        }
    }
    
    private func removeNotifySuperView(){
        notifyView.removeFromSuperview()
        isShow = false
    }
    
}
