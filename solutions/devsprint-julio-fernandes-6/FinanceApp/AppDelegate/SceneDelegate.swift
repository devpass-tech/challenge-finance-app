//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if #available(iOS 15, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = UINavigationBarAppearance()
        }

        guard let windowScene = (scene as? UIWindowScene) else { return }

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController =  TabbarViewController()
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

