//
//  SceneDelegate.swift
//  Ozinshe_UIKit_Second
//
//  Created by Ернат on 20/01/2024.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        (UIApplication.shared.delegate as? AppDelegate)?.self.window = window
        
        let navController = UINavigationController(rootViewController: OnboardingViewController())
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        if let windowScene = scene as? UIWindowScene {
            if let accessToken = UserDefaults.standard.string(forKey: "accessToken") {
                Storage.sharedInstance.accessToken = accessToken
                
                self.window = UIWindow(windowScene: windowScene)
                let viewController = TabBarController()
                self.window?.rootViewController = viewController
                self.window?.makeKeyAndVisible()
            }
        }
    }
}
