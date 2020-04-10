//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        let rootVC = SearchModuleBuilder.buildApp()
        rootVC.navigationItem.title = "Search app via iTunes"
        let navVC = self.configuredAppNavigationController
        navVC.viewControllers = [rootVC]
        navVC.tabBarItem = UITabBarItem(title: "App", image: nil, tag: 0)
        
        let songVC = SearchModuleBuilder.buildSong()
        songVC.navigationItem.title = "Search song via iTunes"
        let navSongVC = self.configuredSongNavigationController
        navSongVC.viewControllers = [songVC]
        navSongVC.tabBarItem = UITabBarItem(title: "Song", image: nil, tag: 0)
        
        tabBarController.viewControllers = [navVC, navSongVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredAppNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
    
    private lazy var configuredSongNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
