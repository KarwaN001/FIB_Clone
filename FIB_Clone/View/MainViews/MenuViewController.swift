//
//  MenuViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class MenuViewController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = HeaderView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        setupHeader()
        setupScrollView()
        setupMenuContent()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupMenuContent() {
        var currentY: CGFloat = 20
        
        // Account Section
        let accountSection = createMenuSection(
            title: "Account",
            items: [
                ("person.circle", "About"),
                ("gearshape", "Settings"),
                ("magnifyingglass", "Invite a Friend")
                
            ]
        )
        contentView.addSubview(accountSection)
        accountSection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: currentY).isActive = true
        accountSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        accountSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        currentY += 200
        
        // Set content height to ensure scrolling
        contentView.heightAnchor.constraint(equalToConstant: currentY + 200).isActive = true
    }
    
    private func createMenuSection(title: String, items: [(String, String)]) -> UIView {
        let sectionView = UIView()
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.backgroundColor = .systemBackground
        sectionView.layer.cornerRadius = 12
        sectionView.layer.shadowColor = UIColor.black.cgColor
        sectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        sectionView.layer.shadowRadius = 8
        sectionView.layer.shadowOpacity = 0.1
        
        // Section title
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = .systemGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sectionView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 16)
        ])
        
        var previousView: UIView = titleLabel
        
        // Create menu items
        for (index, item) in items.enumerated() {
            let itemView = createMenuItem(icon: item.0, title: item.1)
            sectionView.addSubview(itemView)
            
            NSLayoutConstraint.activate([
                itemView.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: index == 0 ? 16 : 0),
                itemView.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor),
                itemView.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
                itemView.heightAnchor.constraint(equalToConstant: 56)
            ])
            
            // Add separator line (except for last item)
            if index < items.count - 1 {
                let separator = UIView()
                separator.backgroundColor = .systemGray5
                separator.translatesAutoresizingMaskIntoConstraints = false
                sectionView.addSubview(separator)
                
                NSLayoutConstraint.activate([
                    separator.topAnchor.constraint(equalTo: itemView.bottomAnchor),
                    separator.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 60),
                    separator.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
                    separator.heightAnchor.constraint(equalToConstant: 1)
                ])
            }
            
            previousView = itemView
        }
        
        // Set section height
        NSLayoutConstraint.activate([
            sectionView.bottomAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 16)
        ])
        
        return sectionView
    }
    
    private func createMenuItem(icon: String, title: String) -> UIView {
        let itemView = UIView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon container
        let iconContainer = UIView()
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: icon)
        iconImageView.tintColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        iconContainer.addSubview(iconImageView)
        
        // Title label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Arrow icon
        let arrowIcon = UIImageView()
        arrowIcon.image = UIImage(systemName: "chevron.right")
        arrowIcon.tintColor = .systemGray3
        arrowIcon.contentMode = .scaleAspectFit
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        
        itemView.addSubview(iconContainer)
        itemView.addSubview(titleLabel)
        itemView.addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            iconContainer.leadingAnchor.constraint(equalTo: itemView.leadingAnchor, constant: 16),
            iconContainer.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 40),
            iconContainer.heightAnchor.constraint(equalToConstant: 40),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            
            arrowIcon.trailingAnchor.constraint(equalTo: itemView.trailingAnchor, constant: -16),
            arrowIcon.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: 12),
            arrowIcon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuItemTapped(_:)))
        itemView.addGestureRecognizer(tapGesture)
        itemView.isUserInteractionEnabled = true
        
        return itemView
    }
    
    @objc private func menuItemTapped(_ gesture: UITapGestureRecognizer) {
        // Handle menu item tap
        if let itemView = gesture.view {
            // Add visual feedback
            UIView.animate(withDuration: 0.1, animations: {
                itemView.alpha = 0.5
            }) { _ in
                UIView.animate(withDuration: 0.1) {
                    itemView.alpha = 1.0
                }
            }
        }
    }
} 

// MARK: - SwiftUI Preview

struct MenuViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MenuViewController {
        return MenuViewController()
    }
    
    func updateUIViewController(_ uiViewController: MenuViewController, context: Context) {
        
    }
}

struct MenuViewController_Previews: PreviewProvider {
    static var previews: some View {
        MenuViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
} 
