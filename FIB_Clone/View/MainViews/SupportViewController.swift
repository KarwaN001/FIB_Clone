//
//  SupportViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class SupportViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        setupScrollView()
        setupContent()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
    
    private func setupContent() {
        // Support title
        let supportTitleLabel = UILabel()
        supportTitleLabel.text = "Support"
        supportTitleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        supportTitleLabel.textColor = .label
        supportTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(supportTitleLabel)
        
        // Live Support Section
        let liveSupportSection = createLiveSupportSection()
        contentView.addSubview(liveSupportSection)
        
        // FAQ Section
        let faqSection = createFAQSection()
        contentView.addSubview(faqSection)
        
        NSLayoutConstraint.activate([
            // Support title
            supportTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            supportTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            // Live Support Section
            liveSupportSection.topAnchor.constraint(equalTo: supportTitleLabel.bottomAnchor, constant: 30),
            liveSupportSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            liveSupportSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // FAQ Section
            faqSection.topAnchor.constraint(equalTo: liveSupportSection.bottomAnchor, constant: 20),
            faqSection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            faqSection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Content height
            contentView.bottomAnchor.constraint(equalTo: faqSection.bottomAnchor, constant: 50)
        ])
    }
    
    private func createLiveSupportSection() -> UIView {
        let sectionView = UIView()
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.backgroundColor = .systemBackground
        sectionView.layer.cornerRadius = 12
        sectionView.layer.shadowColor = UIColor.black.cgColor
        sectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        sectionView.layer.shadowRadius = 8
        sectionView.layer.shadowOpacity = 0.1
        
        // Live Support title
        let titleLabel = UILabel()
        titleLabel.text = "Live Support"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Description text
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Our expert support team is here to help you. Please, choose your preferred method to get in touch with us."
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sectionView.addSubview(titleLabel)
        sectionView.addSubview(descriptionLabel)
        
        // Support options
        let supportOptions = [
            ("message", "Chat With Us"),
            ("phone", "Call Us"),
            ("envelope", "Email Us")
        ]
        
        var previousView: UIView = descriptionLabel
        
        for (index, option) in supportOptions.enumerated() {
            let optionView = createSupportOption(icon: option.0, title: option.1)
            sectionView.addSubview(optionView)
            
            NSLayoutConstraint.activate([
                optionView.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: index == 0 ? 20 : 0),
                optionView.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor),
                optionView.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
                optionView.heightAnchor.constraint(equalToConstant: 60)
            ])
            
            // Add separator line (except for last item)
            if index < supportOptions.count - 1 {
                let separator = UIView()
                separator.backgroundColor = .systemGray5
                separator.translatesAutoresizingMaskIntoConstraints = false
                sectionView.addSubview(separator)
                
                NSLayoutConstraint.activate([
                    separator.topAnchor.constraint(equalTo: optionView.bottomAnchor),
                    separator.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 60),
                    separator.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
                    separator.heightAnchor.constraint(equalToConstant: 1)
                ])
            }
            
            previousView = optionView
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor, constant: -20),
            
            sectionView.bottomAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 20)
        ])
        
        return sectionView
    }
    
    private func createFAQSection() -> UIView {
        let sectionView = UIView()
        sectionView.translatesAutoresizingMaskIntoConstraints = false
        sectionView.backgroundColor = .systemBackground
        sectionView.layer.cornerRadius = 12
        sectionView.layer.shadowColor = UIColor.black.cgColor
        sectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        sectionView.layer.shadowRadius = 8
        sectionView.layer.shadowOpacity = 0.1
        
        let faqOptionView = createSupportOption(icon: "questionmark.circle", title: "FAQ")
        sectionView.addSubview(faqOptionView)
        
        NSLayoutConstraint.activate([
            faqOptionView.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 0),
            faqOptionView.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor),
            faqOptionView.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor),
            faqOptionView.bottomAnchor.constraint(equalTo: sectionView.bottomAnchor),
            faqOptionView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        return sectionView
    }
    
    private func createSupportOption(icon: String, title: String) -> UIView {
        let optionView = UIView()
        optionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: icon)
        iconImageView.tintColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        optionView.addSubview(iconImageView)
        optionView.addSubview(titleLabel)
        optionView.addSubview(arrowIcon)
        
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: optionView.leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            
            arrowIcon.trailingAnchor.constraint(equalTo: optionView.trailingAnchor, constant: -20),
            arrowIcon.centerYAnchor.constraint(equalTo: optionView.centerYAnchor),
            arrowIcon.widthAnchor.constraint(equalToConstant: 12),
            arrowIcon.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        // Add tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(supportOptionTapped(_:)))
        optionView.addGestureRecognizer(tapGesture)
        optionView.isUserInteractionEnabled = true
        
        return optionView
    }
    
    @objc private func supportOptionTapped(_ gesture: UITapGestureRecognizer) {
        // Handle support option tap
        if let optionView = gesture.view {
            // Add visual feedback
            UIView.animate(withDuration: 0.1, animations: {
                optionView.alpha = 0.5
            }) { _ in
                UIView.animate(withDuration: 0.1) {
                    optionView.alpha = 1.0
                }
            }
        }
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