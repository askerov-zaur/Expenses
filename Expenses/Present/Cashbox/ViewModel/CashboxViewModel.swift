//
//  CashboxViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CashboxViewModel {
    
    private let session: Session
    private var emptyArray: [CashboxModel] = [
        CashboxModel(currency: .AZN, data: []),
        CashboxModel(currency: .USD, data: []),
        CashboxModel(currency: .EUR, data: []),
    ]
    init(session: Session) {
        self.session = session
    }
    
    private var totalArray: [Double] = []
    
    var getDataCashboxData: [CashboxModel] {
        return session.casboxDetail
    }
    
    var getCurrency: [String] {
        return session.currency
    }
    var setEmpty: [CashboxModel] {
        get {emptyArray}
        set {emptyArray = newValue}
    }
}
