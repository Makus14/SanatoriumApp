//
//  HomeViewController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        let apperanceTabBar = UITabBarAppearance()
        apperanceTabBar.backgroundColor = UIColor(red: 209/255, green: 206/255, blue: 184/255, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor(red: 65/255, green: 58/255, blue: 13/255, alpha: 1)
        
        
        tabBarController?.tabBar.standardAppearance = apperanceTabBar
    }


}
