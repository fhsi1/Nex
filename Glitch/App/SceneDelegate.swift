//
//  SceneDelegate.swift
//  Glitch
//
//  Created by Yujean Cho on 2023/04/30.
//

import Foundation
import UIKit
import Moya
import KeychainSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        requestCreateUser()
        requestMint()
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = TabBarVC()
        
        KeychainSwift().set("0", forKey: "status")
        
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

}

extension SceneDelegate {
    func requestCreateUser() {
        let provider = MoyaProvider<APIService>()
        
        let json = [
            "address": "0xDF0A4DC76eD4d47a06C3421941504975D5D57FFE"
        ]
        
        provider.request(.createUser(request: json)) { result in
            switch result {
            case .success:
                print("✅ success")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestMint() {
        let provider = MoyaProvider<APIService>()
        
        let json = [
            "address": "0xDF0A4DC76eD4d47a06C3421941504975D5D57FFE"
        ]
        
        provider.request(.mint(request: json)) { result in
            switch result {
            case .success:
                print("✅ success")
            case .failure(let error):
                print(error)
            }
        }
    }
}
