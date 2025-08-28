//
//  ActionItemsDataVM.swift
//  FIB_Clone
//
//  Created by karwan Syborg on 28/08/2025.
//

import Foundation

class ActionItemsData {
    static let shared = ActionItemsData()
    
    private init() {}
    
    let actionItems: [ActionItem] = [
        ActionItem(icon: "paperplane.fill", title: "Send"),
        ActionItem(icon: "plus.circle.fill", title: "Deposit"),
        ActionItem(icon: "minus.circle.fill", title: "Withdraw"),
        ActionItem(icon: "arrow.triangle.2.circlepath", title: "Convert"),
        ActionItem(icon: "lock.fill", title: "Safe box"),
        ActionItem(icon: "gauge.high", title: "Account limit"),
        ActionItem(icon: "location.fill", title: "Around me"),
        ActionItem(icon: "calendar.badge.clock", title: "Installment"),
        ActionItem(icon: "tag.fill", title: "Hot Deals")
    ]
    
    // Function to group items into rows of 4
    func getActionItemsInRows() -> [[ActionItem]] {
        var rows: [[ActionItem]] = []
        let itemsPerRow = 4
        
        for i in stride(from: 0, to: actionItems.count, by: itemsPerRow) {
            let endIndex = min(i + itemsPerRow, actionItems.count)
            let row = Array(actionItems[i..<endIndex])
            rows.append(row)
        }
        
        return rows
    }
} 
