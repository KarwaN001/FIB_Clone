//
//  AccountViewController.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit
import SwiftUI

class AccountViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let headerView = UIView()
    private let balanceCardView = UIView()
    private let actionsContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        //view.backgroundColor = UIColor.systemGray6
        
        setupScrollView()
        setupHeader()
        setupBalanceCard()
        setupActionButtons()
    }
    
    private func setupScrollView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            // Header constraints (fixed at top)
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
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
        // User icon
        let userIconView = UIView()
        userIconView.translatesAutoresizingMaskIntoConstraints = false
        
        let userIcon = UIImageView()
        userIcon.image = UIImage(systemName: "person.fill")
        userIcon.tintColor = .systemGray
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        
        userIconView.addSubview(userIcon)
        
        // User name label
        let nameLabel = UILabel()
        nameLabel.text = "KARWAN SYBORG"
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Notification icon
        let notificationIconView = UIView()
        notificationIconView.translatesAutoresizingMaskIntoConstraints = false
        
        let notificationIcon = UIImageView()
        notificationIcon.image = UIImage(systemName: "bell.fill")
        notificationIcon.tintColor = .systemGray
        notificationIcon.translatesAutoresizingMaskIntoConstraints = false
        
        notificationIconView.addSubview(notificationIcon)
        
        headerView.addSubview(userIconView)
        headerView.addSubview(nameLabel)
        headerView.addSubview(notificationIconView)
        
        NSLayoutConstraint.activate([
            userIconView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            userIconView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            userIconView.widthAnchor.constraint(equalToConstant: 70),
            userIconView.heightAnchor.constraint(equalToConstant: 70),
            
            userIcon.centerXAnchor.constraint(equalTo: userIconView.centerXAnchor),
            userIcon.centerYAnchor.constraint(equalTo: userIconView.centerYAnchor),
            userIcon.widthAnchor.constraint(equalToConstant: 20),
            userIcon.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: userIconView.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            notificationIconView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            notificationIconView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            notificationIconView.widthAnchor.constraint(equalToConstant: 70),
            notificationIconView.heightAnchor.constraint(equalToConstant: 70),
            
            notificationIcon.centerXAnchor.constraint(equalTo: notificationIconView.centerXAnchor),
            notificationIcon.centerYAnchor.constraint(equalTo: notificationIconView.centerYAnchor),
            notificationIcon.widthAnchor.constraint(equalToConstant: 20),
            notificationIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupBalanceCard() {
        balanceCardView.translatesAutoresizingMaskIntoConstraints = false
        balanceCardView.layer.cornerRadius = 16
        balanceCardView.layer.masksToBounds = true
        
        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.6, blue: 0.6, alpha: 1.0).cgColor,
            UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        balanceCardView.layer.insertSublayer(gradientLayer, at: 0)
        
        contentView.addSubview(balanceCardView)
        
        // Account Balance label with flag
        let accountBalanceContainer = UIView()
        accountBalanceContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let flagIcon = UILabel()
        flagIcon.text = "🇮🇶"
        flagIcon.font = UIFont.systemFont(ofSize: 30)
        flagIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let accountBalanceLabel = UILabel()
        accountBalanceLabel.text = "Account Balance"
        accountBalanceLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        accountBalanceLabel.textColor = .white
        accountBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let defaultLabel = UILabel()
        defaultLabel.text = "Default"
        defaultLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        defaultLabel.textColor = .white.withAlphaComponent(0.8)
        defaultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        accountBalanceContainer.addSubview(flagIcon)
        accountBalanceContainer.addSubview(accountBalanceLabel)
        accountBalanceContainer.addSubview(defaultLabel)
        
        // Dropdown arrow
        let dropdownArrow = UIImageView()
        dropdownArrow.image = UIImage(systemName: "slider.horizontal.3")
        dropdownArrow.tintColor = .white
        dropdownArrow.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        dropdownArrow.layer.cornerRadius = 25
        dropdownArrow.contentMode = .center
        dropdownArrow.translatesAutoresizingMaskIntoConstraints = false
        
        // Balance amount
        let balanceAmountLabel = UILabel()
        balanceAmountLabel.text = "1,234.00"
        balanceAmountLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        balanceAmountLabel.textColor = .white
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let currencyLabel = UILabel()
        currencyLabel.text = " IQD"
        currencyLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        currencyLabel.textColor = .white.withAlphaComponent(0.8)
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Transaction History button
        let transactionHistoryButton = UIButton()
        transactionHistoryButton.setImage(UIImage(systemName: "chart.bar.fill"), for: .normal)
        transactionHistoryButton.setTitle("  Transaction History", for: .normal)
        transactionHistoryButton.tintColor = .white
        transactionHistoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        transactionHistoryButton.setTitleColor(.white, for: .normal)
        transactionHistoryButton.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        transactionHistoryButton.layer.cornerRadius = 22
        transactionHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        
        balanceCardView.addSubview(accountBalanceContainer)
        balanceCardView.addSubview(dropdownArrow)
        balanceCardView.addSubview(balanceAmountLabel)
        balanceCardView.addSubview(currencyLabel)
        balanceCardView.addSubview(transactionHistoryButton)
        
        NSLayoutConstraint.activate([
            balanceCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            balanceCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            balanceCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            balanceCardView.heightAnchor.constraint(equalToConstant: 165),
            
            flagIcon.leadingAnchor.constraint(equalTo: accountBalanceContainer.leadingAnchor),
            flagIcon.topAnchor.constraint(equalTo: accountBalanceContainer.topAnchor),
            flagIcon.widthAnchor.constraint(equalToConstant: 30),
            flagIcon.heightAnchor.constraint(equalToConstant: 16),
            
            accountBalanceLabel.leadingAnchor.constraint(equalTo: flagIcon.trailingAnchor, constant: 8),
            accountBalanceLabel.topAnchor.constraint(equalTo: accountBalanceContainer.topAnchor),
            
            defaultLabel.leadingAnchor.constraint(equalTo: accountBalanceLabel.trailingAnchor, constant: 8),
            defaultLabel.topAnchor.constraint(equalTo: accountBalanceContainer.topAnchor),
            defaultLabel.trailingAnchor.constraint(equalTo: accountBalanceContainer.trailingAnchor),
            
            accountBalanceContainer.topAnchor.constraint(equalTo: balanceCardView.topAnchor, constant: 20),
            accountBalanceContainer.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 20),
            
            dropdownArrow.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -20),
            dropdownArrow.topAnchor.constraint(equalTo: balanceCardView.topAnchor, constant: 20),
            dropdownArrow.widthAnchor.constraint(equalToConstant: 50),
            dropdownArrow.heightAnchor.constraint(equalToConstant: 50),
            
            balanceAmountLabel.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 20),
            balanceAmountLabel.topAnchor.constraint(equalTo: accountBalanceContainer.bottomAnchor, constant: 16),
            
            currencyLabel.leadingAnchor.constraint(equalTo: balanceAmountLabel.trailingAnchor),
            currencyLabel.bottomAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor),
            
            transactionHistoryButton.leadingAnchor.constraint(equalTo: balanceCardView.leadingAnchor, constant: 20),
            transactionHistoryButton.trailingAnchor.constraint(equalTo: balanceCardView.trailingAnchor, constant: -20),
            transactionHistoryButton.bottomAnchor.constraint(equalTo: balanceCardView.bottomAnchor, constant: -20),
            transactionHistoryButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // Set gradient frame after layout
        DispatchQueue.main.async {
            gradientLayer.frame = self.balanceCardView.bounds
        }
    }
    
    private func setupActionButtons() {
        actionsContainerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(actionsContainerView)
        
        // Get action items from model
        let actionRows = ActionItemsData.shared.getActionItemsInRows()
        var rowStackViews: [UIStackView] = []
        
        // Create rows dynamically
        for row in actionRows {
            let rowStackView = createActionRowStackView()
            
            // Add action buttons for each item in the row
            for item in row {
                rowStackView.addArrangedSubview(createActionButton(icon: item.icon, title: item.title))
            }
            
            // Fill remaining spaces with empty views if row has less than 4 items
            let remainingSpaces = 4 - row.count
            for _ in 0..<remainingSpaces {
                rowStackView.addArrangedSubview(UIView()) // Empty spacer
            }
            
            rowStackViews.append(rowStackView)
        }
        
        let mainStackView = UIStackView(arrangedSubviews: rowStackViews)
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        actionsContainerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            actionsContainerView.topAnchor.constraint(equalTo: balanceCardView.bottomAnchor, constant: 30),
            actionsContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            actionsContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            actionsContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            mainStackView.topAnchor.constraint(equalTo: actionsContainerView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: actionsContainerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: actionsContainerView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: actionsContainerView.bottomAnchor)
        ])
    }
    
    private func createActionRowStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
        private func createActionButton(icon: String, title: String) -> UIView {
        let containerView = UIView()

//        test test test test
//        containerView.backgroundColor = UIColor.systemGray6
//        containerView.layer.cornerRadius = 32
//        containerView.layer.shadowColor = UIColor.black.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowRadius = 4
//        containerView.layer.shadowOpacity = 0.1
//        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon container with circular background
        let iconContainerView = UIView()
        iconContainerView.backgroundColor = UIColor.systemGray6
        iconContainerView.layer.cornerRadius = 25 // Half of width/height to make it circular
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView()
        iconImageView.image = UIImage(systemName: icon)
        iconImageView.tintColor = .black
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add icon to its container
        iconContainerView.addSubview(iconImageView)
        
        // Add both containers to main container
        containerView.addSubview(iconContainerView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 80),
            
            // Icon container constraints (circular background)
            iconContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            iconContainerView.widthAnchor.constraint(equalToConstant: 50),
            iconContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            // Icon image constraints (centered within circular container)
            iconImageView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // Title label constraints
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconContainerView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -4)
        ])
        
        return containerView
    }
}


// MARK: - SwiftUI Preview

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
