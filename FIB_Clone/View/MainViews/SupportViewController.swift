//
//  SupportViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class SupportViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
       
    }
}

// MARK: - SwiftUI Preview

struct SupportViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> SupportViewController {
        return SupportViewController()
    }
    
    func updateUIViewController(_ uiViewController: SupportViewController, context: Context) {
        
    }
}

struct SupportViewController_Previews: PreviewProvider {
    static var previews: some View {
        SupportViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}