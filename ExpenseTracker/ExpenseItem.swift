//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Silentmode Sdn Bhd on 09/05/2024.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
