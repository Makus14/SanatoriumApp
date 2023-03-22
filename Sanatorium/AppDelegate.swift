//
//  AppDelegate.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit
import GoogleMaps
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyAS6qgX2yi3HcDVg_Um0ScpBP4wkp3R5pM")

        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        let apperanceTabBar = UITabBarAppearance()
        apperanceTabBar.backgroundColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        //TabBarController?.tabBar.tintColor = UIColor(red: 65/255, green: 58/255, blue: 13/255, alpha: 1)
        
        
        //tabBarController?.tabBar.standardAppearance = apperanceTabBar
        
        return true
    }


}

