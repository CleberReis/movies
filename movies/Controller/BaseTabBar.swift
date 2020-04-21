//
//  BaseTabBar.swift
//  movies
//
//  Created by Cleber Reis on 17/04/20.
//  Copyright © 2020 Cleber Reis. All rights reserved.
//

import UIKit

class BaseTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewControllers = [
            addNavController(viewController: MoviesVC(), title: "Filmes", icon: "filme"),
            addNavController(viewController: SearchVC(), title: "Procurar", icon: "explorar"),
            addNavController(viewController: UIViewController(), title: "Favoritos", icon: "favorito")
        ]
        
        tabBar.tintColor = UIColor(red: 253/255, green: 89/255, blue: 35/255, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor.darkGray
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
        
    }
    
    func addNavController(viewController: UIViewController, title: String, icon: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.barTintColor = .white
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.tintColor = UIColor(red: 253/255, green: 89/255, blue: 35/255, alpha: 1)
        navController.navigationBar.shadowImage = UIImage()
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: icon)
        
        return navController
    }
    
}
