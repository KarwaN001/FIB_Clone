//
//  AccountViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class AccountViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
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

struct AccountViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AccountViewController {
        return AccountViewController()
    }
    
    func updateUIViewController(_ uiViewController: AccountViewController, context: Context) {
        
    }
}

struct AccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        AccountViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
} 
