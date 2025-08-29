//
//  HeaderView.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - UI Components
    private let userIconView = UIView()
    private let userIcon = UIImageView()
    private let nameLabel = UILabel()
    private let notificationIconView = UIView()
    private let notificationIcon = UIImageView()
    
    // MARK: - Properties
    var userName: String = "KARWAN SYBORG" {
        didSet {
            nameLabel.text = userName
        }
    }
    
    var onNotificationTapped: (() -> Void)?
    var onUserIconTapped: (() -> Void)?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHeader()
    }
    
    // MARK: - Setup Methods
    private func setupHeader() {
        setupUserIcon()
        setupNameLabel()
        setupNotificationIcon()
        setupConstraints()
        setupGestures()
    }
    
    private func setupUserIcon() {
        userIconView.translatesAutoresizingMaskIntoConstraints = false
        userIcon.image = UIImage(systemName: "person.fill")
        userIcon.tintColor = .systemGray
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        
        userIconView.addSubview(userIcon)
        addSubview(userIconView)
    }
    
    private func setupNameLabel() {
        nameLabel.text = userName
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
    }
    
    private func setupNotificationIcon() {
        notificationIconView.translatesAutoresizingMaskIntoConstraints = false
        notificationIcon.image = UIImage(systemName: "bell.fill")
        notificationIcon.tintColor = .systemGray
        notificationIcon.translatesAutoresizingMaskIntoConstraints = false
        
        notificationIconView.addSubview(notificationIcon)
        addSubview(notificationIconView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userIconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userIconView.widthAnchor.constraint(equalToConstant: 70),
            userIconView.heightAnchor.constraint(equalToConstant: 70),
            
            userIcon.centerXAnchor.constraint(equalTo: userIconView.centerXAnchor),
            userIcon.centerYAnchor.constraint(equalTo: userIconView.centerYAnchor),
            userIcon.widthAnchor.constraint(equalToConstant: 20),
            userIcon.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: userIconView.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            notificationIconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            notificationIconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            notificationIconView.widthAnchor.constraint(equalToConstant: 70),
            notificationIconView.heightAnchor.constraint(equalToConstant: 70),
            
            notificationIcon.centerXAnchor.constraint(equalTo: notificationIconView.centerXAnchor),
            notificationIcon.centerYAnchor.constraint(equalTo: notificationIconView.centerYAnchor),
            notificationIcon.widthAnchor.constraint(equalToConstant: 20),
            notificationIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupGestures() {
        // Add tap gesture to user icon
        let userIconTapGesture = UITapGestureRecognizer(target: self, action: #selector(userIconTapped))
        userIconView.addGestureRecognizer(userIconTapGesture)
        userIconView.isUserInteractionEnabled = true
        
        // Add tap gesture to notification icon
        let notificationTapGesture = UITapGestureRecognizer(target: self, action: #selector(notificationTapped))
        notificationIconView.addGestureRecognizer(notificationTapGesture)
        notificationIconView.isUserInteractionEnabled = true
    }
    
    // MARK: - Actions
    @objc private func userIconTapped() {
        onUserIconTapped?()
    }
    
    @objc private func notificationTapped() {
        onNotificationTapped?()
    }
} 