//
//  DebtViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class DebtViewModel {
    
    private let session: Session
    
    init(session: Session) {
        self.session = session
    }
    
    var getData: [DebtModel] {
        return session.debtModel
    }
    
    var getIndex: Int {
        return session.setAndGetDebtIndex
    }
   
    func setIndex(index: Int) {
        session.setAndGetDebtIndex = index
    }
    
    func setData(item: DebtModel) {
        session.setDebtModel(item: item)
    }
}
