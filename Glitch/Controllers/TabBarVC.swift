//
//  ViewController.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/04/30.
//

import UIKit
import SnapKit

final class TabBarVC: UITabBarController {
    
    lazy var homeVC: UINavigationController =  {
        let vc = UINavigationController(rootViewController: HomeVC())
        let tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "selectedHome"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var eventVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: TrendingVC())
        let tabBarItem = UITabBarItem(title: "Event", image: UIImage(named: "event"), selectedImage: UIImage(named: "selectedEvent"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var accountVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: AccountVC())
        let tabBarItem = UITabBarItem(title: "Account", image: UIImage(named: "account"), selectedImage: UIImage(named: "selectedAccount"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .nPurple
        tabBar.unselectedItemTintColor = .nWhite
        tabBar.barTintColor = .nDarkBlack
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1.00).cgColor
        tabBar.layer.cornerRadius = 15.0
        
        viewControllers = [
            homeVC,
            eventVC,
            accountVC
        ]
    }
}
