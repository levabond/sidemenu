//
//  SceneDelegate.swift
//  Sidebar
//
//  Created by Лев Бондаренко on 02.12.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = UINavigationController(rootViewController: SideBarContainerViewController()) 
        window?.rootViewController = homeVC
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }
}

