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
        let tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var communityVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: CommunityVC())
        let tabBarItem = UITabBarItem(title: "커뮤니티", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var rankVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: RankVC())
        let tabBarItem = UITabBarItem(title: "순위", image: UIImage(systemName: "person.crop.circle"), selectedImage: UIImage(systemName: "person.crop.circle"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    lazy var eventVC: UIViewController =  {
        let vc = UINavigationController(rootViewController: EventVC())
        let tabBarItem = UITabBarItem(title: "이벤트", image: UIImage(systemName: "suit.heart"), selectedImage: UIImage(systemName: "suit.heart"))
        vc.tabBarItem = tabBarItem
        
        return vc
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            mainVC,
            communityVC,
            rankVC,
            eventVC
        ]
    }
}
