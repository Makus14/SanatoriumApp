//
//  AppDelegate.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyAS6qgX2yi3HcDVg_Um0ScpBP4wkp3R5pM")
        
        return true
    }



}

