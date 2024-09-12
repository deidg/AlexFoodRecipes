//
//  ViewController.swift
//  AlexFoodRecipes
//
//  Created by Alex on 08.09.2024.
//

import UIKit
import Foundation


   class MainTabBarViewController: UITabBarController/*, AnyViewController*/ {
       
       override func viewDidLoad() {
       super.viewDidLoad() 
        view.backgroundColor = .blue
        generateTabs()
    }
    
    private func generateTabs() {
        let homeTabVC = UINavigationController(rootViewController: HomeTabVC())
        let favouritesTabVC = UINavigationController(rootViewController: FavouritesTab())
        let newRecipeTabVC = UINavigationController(rootViewController: NewRecipeTab())
        let notificationsTabVC = UINavigationController(rootViewController: NotificationsTabVC())
        let accountTabVC = UINavigationController(rootViewController: AccountTabVC())
        
        homeTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        favouritesTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bookmark"), tag: 0)
        newRecipeTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "plus.circle"), tag: 0)
        notificationsTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bell"), tag: 0)
        accountTabVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName:  "person"), tag: 0)
        
        viewControllers = [homeTabVC, favouritesTabVC, newRecipeTabVC, notificationsTabVC, accountTabVC]
    }
}

