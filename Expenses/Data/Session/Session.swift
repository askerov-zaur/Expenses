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
    private var debtIndex = 0
    private var customerIndex = 0
    private var currencyAmount = ["AZN", "USD", "EUR"]
    
    private var cashDetails: [CashboxModel] = [
        CashboxModel(currency: .AZN, data: [
            CashboxData(date: "06.06.06", hour: "44", amount: 340),
            CashboxData(date: "06.06.06", hour: "33", amount: 500),
            CashboxData(date: "06.06.06", hour: "33", amount: 800),
        ]),
        CashboxModel(currency: .USD, data: [
            CashboxData(date: "06.06.06", hour: "33", amount: 90),
            CashboxData(date: "06.06.06", hour: "33", amount: 80),
            CashboxData(date: "06.06.06", hour: "44", amount: 35),
        ]),
        CashboxModel(currency: .EUR, data: [
            CashboxData(date: "06.06.06", hour: "33", amount: 90),
            CashboxData(date: "06.06.06", hour: "33", amount: 35),
        ]),
    ]
    
    private var customerList: [CustomerModel] = [
        CustomerModel(id: "55", name: "Firuze", surname: "Eliyeva", phoneNumber: "0506006060"),
        CustomerModel(id: "44", name: "Senan", surname: "Eliyev", phoneNumber: "0507007070"),
        CustomerModel(id: "33", name: "zaur", surname: "Askerov", phoneNumber: "0502002020"),
    ]
    
    private var debtArray: [DebtModel] = [
        DebtModel(fullname: "Zaur", id: "ere", data: [
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
        ]),
        DebtModel(fullname: "Bayram", id: "ere", data: [
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
            DebtDetailModel(currency: .AZN, amount: 24, note: "234234", date: "123", hour: "123123"),
        ]),
        
    ]
    
    private let settingsArray: [SettingsModel] = [
        SettingsModel(name: "Profil", icon: "1"),
        SettingsModel(name: "Statistika", icon: "2"),
        SettingsModel(name: "Məlumatları göndər", icon: "3"),
        SettingsModel(name: "Məlumatları sil", icon: "4"),
        SettingsModel(name: "Pin-i dəyiş", icon: "5"),
        SettingsModel(name: "İnteqrasiya təklifləri", icon: "6"),
        SettingsModel(name: "iyanə", icon: "7"),
        SettingsModel(name: "Report et", icon: "8"),
        SettingsModel(name: "Haqqında", icon: "9"),
    ]
    
}

//for read
extension Session {
    
    var casboxDetail: [CashboxModel] {
        return cashDetails
    }
    
    var customer: [CustomerModel] {
        return customerList
    }
    
    var currency: [String] {
        return currencyAmount
    }
    
    var debtModel: [DebtModel] {
        return debtArray
    }
    
    var debtDetailModel: [DebtDetailModel] {
        return debtArray[debtIndex].data
    }
    
    var settingModel: [SettingsModel] {
        return settingsArray
    }
    
}

//for set
extension Session {
    
    var setDebt: [DebtModel] {
        get{debtArray}
        set{debtArray = newValue}
    }
    
    var setAndGetDebtIndex: Int {
        get{debtIndex}
        set{debtIndex = newValue}
    }
    
    var setAndGetCustomerIndex: Int {
        get{customerIndex}
        set{customerIndex = newValue}
    }
    
    func appendAmounCashbox(item: CashboxData, index: Int) {
        cashDetails[index].data.append(item)
    }
    
    func setDebtModel(item: DebtModel) {
        debtArray.append(item)
    }
    
    func addCustomer(inputCustomerInfo: CustomerModel) {
        customerList.append(inputCustomerInfo)
    }
    
    func setDebtDetailModel(item: [DebtDetailModel], index: Int) {
        debtArray[index].data.append(contentsOf: item)
    }
    
}
