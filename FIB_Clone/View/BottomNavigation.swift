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
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.systemGray4.cgColor
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
        navController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: imageName),
            selectedImage: UIImage(systemName: selectedImageName)
        )
        return navController
    }
}

// MARK: - Tab View Controllers

class AccountViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Account"
        
        let label = UILabel()
        label.text = "Account Screen"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class CardsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Cards"
        
        let label = UILabel()
        label.text = "Cards Screen"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class ScanViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Scan"
        
        let label = UILabel()
        label.text = "Scan Screen"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class SupportViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Support"
        
        let label = UILabel()
        label.text = "Support Screen"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Menu"
        
        let label = UILabel()
        label.text = "Menu Screen"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
} 
