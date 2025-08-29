//
//  QRScannerCameraManager.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import AVFoundation

protocol QRScannerCameraManagerDelegate: AnyObject {
    func cameraManager(_ manager: QRScannerCameraManager, didDetectQRCode code: String)
    func cameraManagerDidRequestCameraPermission(_ manager: QRScannerCameraManager)
    func cameraManagerCameraAccessDenied(_ manager: QRScannerCameraManager)
    func cameraManagerCameraUnavailable(_ manager: QRScannerCameraManager)
    func cameraManagerDidConfigureSession(_ manager: QRScannerCameraManager)
}

class QRScannerCameraManager: NSObject {
    
    // MARK: - Properties
    weak var delegate: QRScannerCameraManagerDelegate?
    
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var cameraDevice: AVCaptureDevice?
    private var isScanning = false
    
    // MARK: - Public Methods
    
    func setupCamera() {
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
                        self?.delegate?.cameraManagerCameraAccessDenied(self!)
                    }
                }
            }
        case .denied, .restricted:
            // Permission denied
            DispatchQueue.main.async {
                self.delegate?.cameraManagerCameraAccessDenied(self)
            }
        @unknown default:
            DispatchQueue.main.async {
                self.delegate?.cameraManagerCameraAccessDenied(self)
            }
        }
    }
    
    func setupPreviewLayer(in containerView: UIView) {
        guard let captureSession = captureSession else { return }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        guard let previewLayer = previewLayer else { return }
        
        previewLayer.frame = containerView.bounds
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.cornerRadius = 12
        
        // Insert preview layer below other subviews
        containerView.layer.insertSublayer(previewLayer, at: 0)
        
        // Update preview layer frame after layout
        DispatchQueue.main.async {
            previewLayer.frame = containerView.bounds
        }
    }
    
    func startScanning() {
        guard let captureSession = captureSession, !captureSession.isRunning else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            captureSession.startRunning()
            
            DispatchQueue.main.async {
                self.isScanning = true
            }
        }
    }
    
    func stopScanning() {
        isScanning = false
        
        guard let captureSession = captureSession, captureSession.isRunning else { return }
        
        DispatchQueue.global(qos: .userInitiated).async {
            captureSession.stopRunning()
        }
    }
    
    func updatePreviewLayerFrame(_ containerView: UIView) {
        previewLayer?.frame = containerView.bounds
    }
    
    func pauseScanning() {
        isScanning = false
    }
    
    func resumeScanning() {
        isScanning = true
    }
    
    // MARK: - Private Methods
    
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
            delegate?.cameraManagerCameraUnavailable(self)
            return
        }
        
        cameraDevice = videoCaptureDevice
        
        do {
            let videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            
            if captureSession.canAddInput(videoInput) {
                captureSession.addInput(videoInput)
            } else {
                delegate?.cameraManagerCameraUnavailable(self)
                return
            }
            
            let metadataOutput = AVCaptureMetadataOutput()
            
            if captureSession.canAddOutput(metadataOutput) {
                captureSession.addOutput(metadataOutput)
                
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
            } else {
                delegate?.cameraManagerCameraUnavailable(self)
                return
            }
            
            // Notify delegate that session is configured
            delegate?.cameraManagerDidConfigureSession(self)
            
        } catch {
            delegate?.cameraManagerCameraUnavailable(self)
        }
    }
    
    private func handleQRCodeDetected(_ code: String) {
        // Prevent multiple rapid detections
        guard isScanning else { return }
        
        pauseScanning()
        delegate?.cameraManager(self, didDetectQRCode: code)
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension QRScannerCameraManager: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first else { return }
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
        guard let stringValue = readableObject.stringValue else { return }
        
        handleQRCodeDetected(stringValue)
    }
} 
