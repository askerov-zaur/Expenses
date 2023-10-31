//
//  DebtDetailViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import Foundation

protocol DebtDetailDeleget: AnyObject {
    func reloadData()
    func dismiss()
}

class DebtDetailViewModel {
    
    private let session: Session
    private var date = Date().formatted(date: .abbreviated, time: .omitted)
    private var hour = Date().formatted(date: .omitted, time: .shortened)
    
    weak var deleget: DebtDetailDeleget?
    
    init(session: Session) {
        self.session = session
    }
    
    var getData: [DebtDetailModel] {
        return session.debtDetailModel
    }
    
    var getDataFullname: [DebtModel] {
        return session.debtModel
    }
    
    var getIndex: Int {
        return session.setAndGetDebtIndex
    }
    
    func appendCashbox(amount: Double, index: Int) {
        let item = CashboxData(date: date, hour: hour, amount: amount)
        session.appendAmounCashbox(item: item, index: index)
        deleget?.reloadData()
    }
    
    func appendAmount(index: Int, amount: Double) {
        var mainCashboxIndex = 0
        let debtIndex = session.setAndGetDebtIndex
        let currency = session.debtModel[session.setAndGetDebtIndex].data[index].currency
        var mainAmount: Double {
            get {session.setDebt[session.setAndGetDebtIndex].data[index].amount}
            set {session.setDebt[session.setAndGetDebtIndex].data[index].amount = newValue}
        }
        
        switch currency {
        case .AZN:
            mainCashboxIndex = 0
        case .USD:
            mainCashboxIndex = 1
        case .EUR:
            mainCashboxIndex = 2
        }
        
        if amount < mainAmount {
            mainAmount -= amount
            appendCashbox(amount: amount, index: mainCashboxIndex)
        } else if amount == mainAmount && session.debtModel[session.setAndGetDebtIndex].data.count == 1 {
            mainAmount = 0.0
            appendCashbox(amount: amount, index: mainCashboxIndex)
            session.setDebt[debtIndex].data.removeAll()
            deleget?.dismiss()
        } else if amount == mainAmount {
            mainAmount = 0.0
            appendCashbox(amount: amount, index: mainCashboxIndex)
            session.setDebt[debtIndex].data.remove(at: index)
        } else if amount > mainAmount {
            print("Mebleg boyukdur")
        }
        deleget?.reloadData()
    }
}
