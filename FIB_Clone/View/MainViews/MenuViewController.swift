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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        setupHeader()
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
