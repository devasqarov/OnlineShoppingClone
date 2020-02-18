//
//  AppDelegate.swift
//  OnlineShoppingClone
//
//  Created by Nodirbek Asqarov on 2/13/20.
//  Copyright © 2020 Nodirbek Asqarov. All rights reserved.
//

import UIKit
import AKSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        let navigationController = UINavigationController(rootViewController: HomeVC())
        let leftMenuViewController = MyNavigationVC(rootViewController: SideMenuVC())
        let rightMenuViewController = UIViewController()
        // Create side menu controller
        let sideMenuViewController: AKSideMenu = AKSideMenu(contentViewController: navigationController, leftMenuViewController: leftMenuViewController, rightMenuViewController: rightMenuViewController)
        
        window?.rootViewController = sideMenuViewController
        
        window?.makeKeyAndVisible()
        return true
    }



}
