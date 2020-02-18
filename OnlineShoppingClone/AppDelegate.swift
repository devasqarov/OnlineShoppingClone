//
//  AppDelegate.swift
//  OnlineShoppingClone
//


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        //Nodirbek
        
        window?.rootViewController = UINavigationController(rootViewController: HomeVC(nibName: "HomeVC", bundle: nil))

        window?.makeKeyAndVisible()
        return true
    }



}
