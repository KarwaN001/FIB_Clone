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
        let homeVC = createTabViewController(
            title: "Home",
            imageName: "house",
            selectedImageName: "house.fill",
            viewController: HomeViewController()
        )
        
        let accountsVC = createTabViewController(
            title: "Accounts",
            imageName: "creditcard",
            selectedImageName: "creditcard.fill",
            viewController: AccountsViewController()
        )
        
        let transferVC = createTabViewController(
            title: "Transfer",
            imageName: "arrow.left.arrow.right",
            selectedImageName: "arrow.left.arrow.right.circle.fill",
            viewController: TransferViewController()
        )
        
        let paymentsVC = createTabViewController(
            title: "Payments",
            imageName: "banknote",
            selectedImageName: "banknote.fill",
            viewController: PaymentsViewController()
        )
        
        let moreVC = createTabViewController(
            title: "More",
            imageName: "ellipsis",
            selectedImageName: "ellipsis.circle.fill",
            viewController: MoreViewController()
        )
        
        viewControllers = [homeVC, accountsVC, transferVC, paymentsVC, moreVC]
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

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Home"
        
        let label = UILabel()
        label.text = "Home Screen"
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

class AccountsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Accounts"
        
        let label = UILabel()
        label.text = "Accounts Screen"
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

class TransferViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Transfer"
        
        let label = UILabel()
        label.text = "Transfer Screen"
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

class PaymentsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Payments"
        
        let label = UILabel()
        label.text = "Payments Screen"
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

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "More"
        
        let label = UILabel()
        label.text = "More Screen"
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
