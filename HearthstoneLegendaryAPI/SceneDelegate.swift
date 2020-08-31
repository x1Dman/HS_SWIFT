//
//  SceneDelegate.swift
//  HearthstoneLegendaryAPI
//
//  Created by 18579118 on 29.07.2020.
//  Copyright © 2020 18579118. All rights reserved.
//

import UIKit




class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? // main window
    var loadingWindow: UIWindow? // window for loading
    
    // TODO: - Add pop/push stack with windows (might be helpful) -
    func openLoadingWindow() {
        loadingWindow?.makeKeyAndVisible()
    }
    
    func closeLoadingWindow() {
        window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // setup loading windows
        let loadingViewController = LoadingViewController()
        loadingWindow = UIWindow(frame: UIScreen.main.bounds)
        loadingWindow?.windowScene = windowScene
        loadingWindow?.rootViewController = loadingViewController
        
        // setup main window
        let wireframe = AuthScreenWireframe()
        let viewController = wireframe.viewController
        let navigationController = UINavigationController()
        navigationController.viewControllers = [viewController]
        Router.instance.setNavigationController(navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

