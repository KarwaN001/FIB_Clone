//
//  CardsViewModel.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import Foundation
import UIKit

class CardsViewModel: ObservableObject {
    @Published var cards: [Card] = []
    
    init() {
        loadCards()
    }
    
    private func loadCards() {
        cards = [
            Card(
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
            ),
            Card(
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
        ]
    }
    
    func getCards() -> [Card] {
        return cards
    }
    
    func addNewCard() {
        //  logic for adding new cards
    }
    
    func getCardCount() -> Int {
        return cards.count
    }
    
    func canAddNewCard() -> Bool {
        // Business rule: example limit of 5 cards per user
        return cards.count < 5
    }
} 