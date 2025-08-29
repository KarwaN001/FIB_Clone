//
//  ScanViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class ScanViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
    }
} 

// MARK: - SwiftUI Preview

struct ScanViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ScanViewController {
        return ScanViewController()
    }
    
    func updateUIViewController(_ uiViewController: ScanViewController, context: Context) {
        
    }
}

struct ScanViewController_Previews: PreviewProvider {
    static var previews: some View {
        ScanViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}