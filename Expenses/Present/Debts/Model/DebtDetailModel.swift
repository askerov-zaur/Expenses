//
//  DebtDetailModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import Foundation

enum CurrencyType: String, Codable, CaseIterable {
    case AZN = "AZN"
    case USD = "USD"
    case EUR = "EUR"
}

struct DebtDetailModel: Codable {
    let currency: CurrencyType
    var amount: Double
    let note: String
    let date: String
    let hour: String
    
}
