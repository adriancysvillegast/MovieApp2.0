//
//  TabBarController.swift
//  MovieApp 2.0
//
//  Created by Adriancys Jesus Villegas Toro on 1/8/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        navigationItem.hidesBackButton = true
        setupVCs()

    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {

        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }

    func setupVCs() {
            viewControllers = [
                createNavController(for: TopMovieViewController(), title: NSLocalizedString("Top Movie", comment: ""), image: UIImage(systemName: "house")!),
                createNavController(for: GenresViewController(), title: NSLocalizedString("Genre", comment: ""), image: UIImage(systemName: "list.dash")!)
            ]
        }
    


}
