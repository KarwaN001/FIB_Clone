//
//  CardsViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class CardsViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let headerView = UIView()
    private var cardViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Update gradient frames after layout
        for cardView in cardViews {
            if let gradientLayer = cardView.layer.sublayers?.first as? CAGradientLayer {
                gradientLayer.frame = cardView.bounds
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        setupScrollView()
        setupHeader()
        setupCards()
        setupGetNewCardButton()
    }
    
    private func setupScrollView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            // Header constraints (fixed at top, extending to top of view)
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 104),
            
            // ScrollView constraints (below header)
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupHeader() {
        // Create red gradient background like AccountViewController
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0).cgColor,
            UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        headerView.layer.insertSublayer(gradientLayer, at: 0)
        
        let titleLabel = UILabel()
        titleLabel.text = "Debit Cards"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16)
        ])
        
        // Set gradient frame after layout
        DispatchQueue.main.async {
            gradientLayer.frame = self.headerView.bounds
        }
    }
    
    private func setupCards() {
        // Blue card
        let blueCard = createCard(
            bankName: "SIB BANK",
            cardNumber: "XXXX    XXXX    XXXX    XXXX ",
            cardHolderName: "test test",
            expiryDate: "05/29",
            cvv: "***",
            cardType: "VISA",
            gradientColors: [
                UIColor(red: 0.2, green: 0.6, blue: 1.0, alpha: 1.0).cgColor,
                UIColor(red: 0.1, green: 0.4, blue: 0.8, alpha: 1.0).cgColor
            ],
            isBlueCard: true
        )
        
        // Dark card with pattern
        let darkCard = createCard(
            bankName: "SIB BANK",
            cardNumber: "XXXX    XXXX    XXXX    XXXX ",
            cardHolderName: "TEST TEST",
            expiryDate: "05/29",
            cvv: "***",
            cardType: "VISA",
            gradientColors: [
                UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).cgColor,
                UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0).cgColor
            ],
            isBlueCard: false
        )
        
        
        contentView.addSubview(blueCard)
        contentView.addSubview(darkCard)
        
        cardViews = [blueCard, darkCard]
        
        NSLayoutConstraint.activate([
            // Blue card constraints
            blueCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            blueCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            blueCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            blueCard.heightAnchor.constraint(equalToConstant: 200),
            
            // Dark card constraints
            darkCard.topAnchor.constraint(equalTo: blueCard.bottomAnchor, constant: 20),
            darkCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            darkCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            darkCard.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func createCard(
        bankName: String,
        cardNumber: String,
        cardHolderName: String,
        expiryDate: String,
        cvv: String,
        cardType: String,
        gradientColors: [CGColor],
        isBlueCard: Bool
    ) -> UIView {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.layer.cornerRadius = 16
        
        // Add shadow (masksToBounds must be false for shadows to show)
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 8
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.masksToBounds = false
        
        // Create gradient background
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 16
        cardView.layer.insertSublayer(gradientLayer, at: 0)
        
        // Add pattern overlay for dark card
        if !isBlueCard {
            let patternView = UIView()
            patternView.translatesAutoresizingMaskIntoConstraints = false
            patternView.backgroundColor = UIColor.clear
            
            // Create geometric pattern
            let patternLayer = CAShapeLayer()
            let path = UIBezierPath()
            
            // Add diagonal lines pattern
            for i in 0..<10 {
                let startX = CGFloat(i * 40)
                path.move(to: CGPoint(x: startX, y: 0))
                path.addLine(to: CGPoint(x: startX + 100, y: 200))
            }
            
            patternLayer.path = path.cgPath
            patternLayer.strokeColor = UIColor.white.withAlphaComponent(0.1).cgColor
            patternLayer.lineWidth = 1
            patternView.layer.addSublayer(patternLayer)
            
            cardView.addSubview(patternView)
            NSLayoutConstraint.activate([
                patternView.topAnchor.constraint(equalTo: cardView.topAnchor),
                patternView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
                patternView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
                patternView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor)
            ])
        }
        
        // Bank name and logo
        let bankLabel = UILabel()
        bankLabel.text = bankName
        bankLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        bankLabel.textColor = .white
        bankLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Card number
        let cardNumberLabel = UILabel()
        cardNumberLabel.text = cardNumber
        cardNumberLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: .medium)
        cardNumberLabel.textColor = .white
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Card holder name
        let cardHolderLabel = UILabel()
        cardHolderLabel.text = cardHolderName.uppercased()
        cardHolderLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cardHolderLabel.textColor = .white
        cardHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Expiry date
        let expiryLabel = UILabel()
        expiryLabel.text = expiryDate
        expiryLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        expiryLabel.textColor = .white
        expiryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // CVV
        let cvvLabel = UILabel()
        cvvLabel.text = cvv
        cvvLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        cvvLabel.textColor = .white
        cvvLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // VISA logo
        let visaLabel = UILabel()
        visaLabel.text = cardType
        visaLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        visaLabel.textColor = .white
        visaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(bankLabel)
        cardView.addSubview(cardNumberLabel)
        cardView.addSubview(cardHolderLabel)
        cardView.addSubview(expiryLabel)
        cardView.addSubview(cvvLabel)
        cardView.addSubview(visaLabel)
        
        NSLayoutConstraint.activate([
            // Bank name
            bankLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            bankLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            // VISA logo
            visaLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            visaLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            
            // Card number
            cardNumberLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            cardNumberLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor, constant: 10),
            
            // Card holder name
            cardHolderLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            cardHolderLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            
            // Expiry date
            expiryLabel.trailingAnchor.constraint(equalTo: cvvLabel.leadingAnchor, constant: -20),
            expiryLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
            
            // CVV
            cvvLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),
            cvvLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
        
        return cardView
    }
    
    private func setupGetNewCardButton() {
        let getNewCardButton = UIButton()
        getNewCardButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Create button with plus icon and text
        let plusIcon = UIImage(systemName: "plus")
        getNewCardButton.setImage(plusIcon, for: .normal)
        getNewCardButton.setTitle("  Get new card", for: .normal)
        getNewCardButton.tintColor =  UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0)
        getNewCardButton.setTitleColor(UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0), for: .normal)
        getNewCardButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        getNewCardButton.addTarget(self, action: #selector(getNewCardTapped), for: .touchUpInside)
        
        contentView.addSubview(getNewCardButton)
        
        NSLayoutConstraint.activate([
            getNewCardButton.topAnchor.constraint(equalTo: cardViews.last?.bottomAnchor ?? contentView.topAnchor, constant: 30),
            getNewCardButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            getNewCardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            getNewCardButton.heightAnchor.constraint(equalToConstant: 50),
            getNewCardButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    @objc private func getNewCardTapped() {
        // Add haptic feedback
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.impactOccurred()
        
        // Show alert for now (you can implement actual functionality later)
        let alert = UIAlertController(title: "Get New Card", message: "test test test", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
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
