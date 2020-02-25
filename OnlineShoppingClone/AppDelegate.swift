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
