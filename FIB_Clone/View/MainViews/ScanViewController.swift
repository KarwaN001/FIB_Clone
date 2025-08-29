//
//  ScanViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI
import AVFoundation

class ScanViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    // MARK: - UI Components
    private let titleLabel = UILabel()
    private let cameraView = UIView()
    private let scanLineView = UIView()
    private let instructionLabel = UILabel()
    private let notWorkingLabel = UILabel()
    private let enterManuallyButton = UIButton()
    
    // MARK: - Camera Components
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var cameraDevice: AVCaptureDevice?
    private var isScanning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCamera()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScanning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopScanning()
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
        cameraView.layer.masksToBounds = true
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
    
    // MARK: - Camera Setup
    private func setupCamera() {
        // Check camera authorization status
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // Already authorized, configure session
            DispatchQueue.main.async {
                self.configureCaptureSession()
            }
        case .notDetermined:
            // Request permission
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    if granted {
                        self?.configureCaptureSession()
                    } else {
                        self?.showCameraAccessDeniedAlert()
                    }
                }
            }
        case .denied, .restricted:
            // Permission denied
            DispatchQueue.main.async {
                self.showCameraAccessDeniedAlert()
            }
        @unknown default:
            DispatchQueue.main.async {
                self.showCameraAccessDeniedAlert()
            }
        }
    }
    
    private func configureCaptureSession() {
        // Ensure we're on the main queue for UI updates
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.configureCaptureSession()
            }
            return
        }
        
        captureSession = AVCaptureSession()
        guard let captureSession = captureSession else { return }
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {
            showCameraUnavailableAlert()
            return
        }
        
        cameraDevice = videoCaptureDevice
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                showCameraUnavailableAlert()
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
            } else {
                showCameraUnavailableAlert()
                return
            }
            
            setupPreviewLayer()
            
        } catch {
            showCameraUnavailableAlert()
        }
    }
    
    private func setupPreviewLayer() {
        guard let captureSession = captureSession else { return }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        guard let previewLayer = previewLayer else { return }
        
        previewLayer.frame = cameraView.bounds
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.cornerRadius = 12
        
        // Insert preview layer below the scan line
        cameraView.layer.insertSublayer(previewLayer, at: 0)
        
        // Update preview layer frame after layout
        DispatchQueue.main.async {
            previewLayer.frame = self.cameraView.bounds
        }
    }
    
    private func startScanning() {
        guard let captureSession = captureSession, !captureSession.isRunning else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            captureSession.startRunning()
            
            DispatchQueue.main.async {
                self.isScanning = true
                // Update preview layer frame
                if let previewLayer = self.previewLayer {
                    previewLayer.frame = self.cameraView.bounds
                }
            }
        }
    }
    
    private func stopScanning() {
        isScanning = false
        
        guard let captureSession = captureSession, captureSession.isRunning else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            captureSession.stopRunning()
        }
    }
    
    // MARK: - Alert Methods
    private func showCameraAccessDeniedAlert() {
        let alert = UIAlertController(
            title: "Camera Access Denied",
            message: "Please enable camera access in Settings to scan QR codes.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsUrl)
            }
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    private func showCameraUnavailableAlert() {
        let alert = UIAlertController(
            title: "Camera Unavailable",
            message: "Camera is not available on this device.",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
    }
    
    private func handleQRCodeDetected(_ code: String) {
        // Prevent multiple rapid detections
        guard isScanning else { return }
        
        isScanning = false
        
        // Provide haptic feedback
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        
        // Show detected QR code
        let alert = UIAlertController(
            title: "QR Code Detected",
            message: "Content: \(code)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Scan Another", style: .default) { _ in
            self.isScanning = true
        })
        
        alert.addAction(UIAlertAction(title: "Done", style: .cancel))
        
        present(alert, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Update preview layer frame when view layout changes
        if let previewLayer = previewLayer {
            previewLayer.frame = cameraView.bounds
        }
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

        print("test test test test")
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension ScanViewController {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first else { return }
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
        guard let stringValue = readableObject.stringValue else { return }
        
        handleQRCodeDetected(stringValue)
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