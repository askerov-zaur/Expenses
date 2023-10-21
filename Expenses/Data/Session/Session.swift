//
//  Session.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

class Session {
    
    private init() {}
    static let shared = Session()
    
    private var cashDetails: [CashboxModel] = [
        CashboxModel(currency: "AZN", date: "16.06", amount: 12.2, totalAmount: 22),
        CashboxModel(currency: "AZN", date: "16.06", amount: 12.2, totalAmount: 22),
        CashboxModel(currency: "AZN", date: "16.06", amount: 12.2, totalAmount: 22),
    ]
    
}

//for read
extension Session {
    
    var detail: [CashboxModel] {
        return cashDetails
    }
    
}

//for set
