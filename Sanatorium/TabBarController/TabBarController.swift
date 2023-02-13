//
//  TabBarController.swift
//  Sanatorium
//
//  Created by Mac on 18/01/2023.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let dataSource: [TabBarItem] = [.home, .selection, .search, .map, .favourite]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .home:
                let homeController = HomeViewController()
                    return self.wrappedInNavigationController(with: homeController, title: $0.title)
            case .search:
                let searchController = SearchViewController()
                    return self.wrappedInNavigationController(with: searchController, title: $0.title)
            case .favourite:
                let favouriteController = FavouriteViewController()
                    return self.wrappedInNavigationController(with: favouriteController, title: $0.title)
            case .selection:
                let selectionController = SelectionViewController()
                    return self.wrappedInNavigationController(with: selectionController, title: $0.title)
            case .map:
                let mapController = MapViewController()
                    return self.wrappedInNavigationController(with: mapController, title: $0.title)
            }
        }
        
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(systemName: dataSource[$0].iconName)
            tabBar.tintColor = .white
            //tabBar.backgroundColor = .green
        }
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> UINavigationController {
            return UINavigationController(rootViewController: with)
    }
    
}

private enum TabBarItem {
    case favourite
    case selection
    case map
    case search
    case home
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .search:
            return "Поиск"
        case .favourite:
            return "Избранное"
        case .selection:
            return "Все санатории"
        case .map:
            return "Карта"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .favourite:
            return "heart"
        case .selection:
            return "book"
        case .map:
            return "flag"
        }
    }
}
