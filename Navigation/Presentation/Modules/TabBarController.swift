//
//  TabBarControllerViewController.swift
//  Navigation
//
//  Created by Sergey on 28.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
       
    }
    
    private func setupView(){
        UITabBar.appearance().backgroundColor = .white
        
        let feed = FeedViewController()
        let feedIcon = UIImage(systemName: "house.fill")
        feed.tabBarItem = UITabBarItem(title: "Feed", image: feedIcon, tag: 0)
        
        let profile = ProfileViewController()
        let profileIcon = UIImage(systemName: "person.fill")
        profile.tabBarItem = UITabBarItem(title: "Profile", image: profileIcon, tag: 1)
        
        self.viewControllers = [
            UINavigationController(rootViewController: feed),
            UINavigationController(rootViewController: profile)
        ]
    }

}
