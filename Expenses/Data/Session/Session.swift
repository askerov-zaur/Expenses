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
    
    private var CustomerDetail: [CashboxModel] = []
    
}
