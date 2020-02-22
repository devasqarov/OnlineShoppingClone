//
//  AppDelegate.swift
//  OnlineShoppingClone
//
//  Created by Nodirbek Asqarov on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        window?.rootViewController = DetailProductVC(nibName: "DetailProductVC", bundle: nil)
        window?.makeKeyAndVisible()
        return true
    }



}
