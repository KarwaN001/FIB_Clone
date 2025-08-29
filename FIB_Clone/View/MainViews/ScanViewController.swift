//
//  ScanViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class ScanViewController: UIViewController {
    
    // MARK: - UI Components
    private let titleLabel = UILabel()
    private let cameraView = UIView()
    private let scanLineView = UIView()
    private let instructionLabel = UILabel()
    private let notWorkingLabel = UILabel()
    private let enterManuallyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        setupHeader()
        setupCameraView()
        setupInstructionText()
        setupNotWorkingText()
        setupEnterManuallyButton()
    }
    
    private func setupHeader() {
        // Title
        titleLabel.text = "Scan QR Code"
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupCameraView() {
        cameraView.backgroundColor = .black
        cameraView.layer.cornerRadius = 12
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        
        // Create scanning line
        scanLineView.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
        scanLineView.translatesAutoresizingMaskIntoConstraints = false
        
        cameraView.addSubview(scanLineView)
        view.addSubview(cameraView)
        
        NSLayoutConstraint.activate([
            cameraView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            cameraView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cameraView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cameraView.heightAnchor.constraint(equalTo: cameraView.widthAnchor),
            
            scanLineView.centerXAnchor.constraint(equalTo: cameraView.centerXAnchor),
            scanLineView.centerYAnchor.constraint(equalTo: cameraView.centerYAnchor),
            scanLineView.widthAnchor.constraint(equalToConstant: 200),
            scanLineView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        // Add scanning animation
        startScanAnimation()
    }
    
    private func setupInstructionText() {
        instructionLabel.text = "Position the camera on top of the QR Code to scan it."
        instructionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        instructionLabel.textColor = .systemGray
        instructionLabel.backgroundColor = .systemBackground
        instructionLabel.textAlignment = .center
        instructionLabel.numberOfLines = 0
        instructionLabel.layer.cornerRadius = 12
        instructionLabel.layer.masksToBounds = true
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(instructionLabel)
        
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: cameraView.bottomAnchor, constant: 30),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            instructionLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupNotWorkingText() {
        notWorkingLabel.text = "Not working?"
        notWorkingLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        notWorkingLabel.textColor = .systemGray
        notWorkingLabel.textAlignment = .center
        notWorkingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(notWorkingLabel)
        
        NSLayoutConstraint.activate([
            notWorkingLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 60),
            notWorkingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupEnterManuallyButton() {
        enterManuallyButton.setTitle("Enter manually", for: .normal)
        enterManuallyButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        enterManuallyButton.setTitleColor(.white, for: .normal)
        enterManuallyButton.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
        enterManuallyButton.layer.cornerRadius = 25
        enterManuallyButton.translatesAutoresizingMaskIntoConstraints = false
        enterManuallyButton.addTarget(self, action: #selector(enterManuallyTapped), for: .touchUpInside)
        
        view.addSubview(enterManuallyButton)
        
        NSLayoutConstraint.activate([
            enterManuallyButton.topAnchor.constraint(equalTo: notWorkingLabel.bottomAnchor, constant: 10),
            enterManuallyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterManuallyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            enterManuallyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func startScanAnimation() {
        // Animate the scan line fading in and out (opacity animation)
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.scanLineView.alpha = 0.0
        })
    }
    
    @objc private func enterManuallyTapped() {
        // Handle enter manually button tap
        UIView.animate(withDuration: 0.1, animations: {
            self.enterManuallyButton.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.enterManuallyButton.alpha = 1.0
            }
        }
        
        // Add your manual entry logic here
        print("Enter manually tapped")
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