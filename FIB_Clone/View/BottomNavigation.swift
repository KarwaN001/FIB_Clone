//
//  BottomNavigation.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit

class BottomNavigation: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
        tabBar.unselectedItemTintColor = .systemGray
        
        // Remove border line
        tabBar.layer.borderWidth = 0
        tabBar.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setupViewControllers() {
        let accountVC = createTabViewController(
            title: "Account",
            imageName: "building.columns",
            selectedImageName: "building.columns.fill",
            viewController: AccountViewController()
        )
        
        let cardsVC = createTabViewController(
            title: "Cards",
            imageName: "creditcard",
            selectedImageName: "creditcard.fill",
            viewController: CardsViewController()
        )
        
        let scanVC = createTabViewController(
            title: "Scan",
            imageName: "qrcode.viewfinder",
            selectedImageName: "qrcode.viewfinder",
            viewController: ScanViewController()
        )
        
        let supportVC = createTabViewController(
            title: "Support",
            imageName: "questionmark.circle",
            selectedImageName: "questionmark.circle.fill",
            viewController: SupportViewController()
        )
        
        let menuVC = createTabViewController(
            title: "Menu",
            imageName: "square.grid.2x2",
            selectedImageName: "square.grid.2x2.fill",
            viewController: MenuViewController()
        )
        
        viewControllers = [accountVC, cardsVC, scanVC, supportVC, menuVC]
    }
    
    private func createTabViewController(title: String, imageName: String, selectedImageName: String, viewController: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        
        // Hide navigation bar for cleaner look
        navController.navigationBar.isHidden = true
        
        navController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: selectedImageName)
        )
        return navController
    }
} 
