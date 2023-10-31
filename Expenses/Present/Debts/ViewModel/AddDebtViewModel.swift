//
//  AddDebtViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 23.10.23.
//

import Foundation

protocol AddDebtDeleget: AnyObject {
    func reload()
}

class AddDebtViewModel {
    
    weak var deleget: AddDebtDeleget?
    private var date = Date().formatted(date: .complete, time: .omitted)
    private var hour = Date().formatted(date: .omitted, time: .complete)
    
    private let session: Session
    
    init(session: Session) {
        self.session = session
    }

    var getCurrencyData: [String] {
        return session.currency
    }
    
    var getDate: String {
        return date
    }
    
    var getHour: String {
        return date
    }
    
    var setDebtData: [DebtModel] {
        return session.setDebt
    }
    
    var getDataCustomer: [CustomerModel] {
        return session.customer
    }
    
    var getDataCustomerIndex: Int {
        return session.setAndGetCustomerIndex
    }
    
    func setDebtData(item: DebtModel) {
        return session.setDebtModel(item: item)
    }

    func setIndex(index: Int) {
        session.setAndGetCustomerIndex = index
    }
    
    func setData(item: DebtModel) {
        let index = setDebtData.firstIndex { $0.id == item.id }
        guard let index = index else {return session.setDebtModel(item: item)}
        session.setDebtDetailModel(item: item.data, index: index)
    }
}
