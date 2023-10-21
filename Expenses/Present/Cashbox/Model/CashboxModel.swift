//
//  CashboxModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

struct CashboxModel: Codable  {
    
    let currency: String
    let date: String
    let amount: Double
    let totalAmount: Double

}
