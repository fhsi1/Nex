//
//  ViewController.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/04/30.
//

import UIKit
import SnapKit

final class TabBarVC: UITabBarController {
    
    lazy var mainVC: UINavigationController =  {
        let vc = UINavigationController(rootViewController: MainVC())
        let tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "selectedHome"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var communityVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: CommunityVC())
        let tabBarItem = UITabBarItem(title: "Community", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var rankVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: RankVC())
        let tabBarItem = UITabBarItem(title: "Ranking", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var eventVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: EventVC())
        let tabBarItem = UITabBarItem(title: "Event", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
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
            mainVC,
            communityVC,
            rankVC,
            eventVC
        ]
    }
}
