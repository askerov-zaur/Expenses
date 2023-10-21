//
//  DebtModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

struct DebtModel: Codable {
    
    let currency: String
    let amount: Double
    let note: String
    let totalAmount: Double
    
}
