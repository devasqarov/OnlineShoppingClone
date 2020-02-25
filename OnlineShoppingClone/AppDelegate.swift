//
//  AppDelegate.swift
//  OnlineShoppingClone
//


import UIKit
import AKSideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let vc = UINavigationController(rootViewController: WelcomeVC(nibName: "WelcomeVC", bundle: nil))
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        if let _ = UserDefaults.standard.string(forKey: DefaultKeys.LANG_KEY) {
        } else {
            UserDefaults.standard.set("en", forKey: DefaultKeys.LANG_KEY)
        }
        return true
    }



}
