//
//  CardsViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

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

// MARK: - SwiftUI Preview

struct CardsViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CardsViewController {
        return CardsViewController()
    }
    
    func updateUIViewController(_ uiViewController: CardsViewController, context: Context) {
        
    }
}

struct CardsViewController_Previews: PreviewProvider {
    static var previews: some View {
        CardsViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}
