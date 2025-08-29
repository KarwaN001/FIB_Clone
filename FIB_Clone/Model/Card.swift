//
//  Card.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import UIKit

struct Card {
    let id: String
    let bankName: String
    let cardNumber: String
    let cardHolderName: String
    let expiryDate: String
    let cvv: String
    let cardType: String
    let gradientColors: [CGColor]
    let isBlueCard: Bool
    
    init(id: String = UUID().uuidString,
         bankName: String,
         cardNumber: String,
         cardHolderName: String,
         expiryDate: String,
         cvv: String,
         cardType: String,
         gradientColors: [CGColor],
         isBlueCard: Bool) {
        self.id = id
        self.bankName = bankName
        self.cardNumber = cardNumber
        self.cardHolderName = cardHolderName
        self.expiryDate = expiryDate
        self.cvv = cvv
        self.cardType = cardType
        self.gradientColors = gradientColors
        self.isBlueCard = isBlueCard
    }
} 