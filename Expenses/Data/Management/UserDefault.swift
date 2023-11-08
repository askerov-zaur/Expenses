//
//  UserDefault.swift
//  Expenses
//
//  Created by Zaur Askerov on 31.10.23.
//

import Foundation

extension UserDefaults {
    
    struct Keys {
        static let cashbox = "cashbox"
        static let debt = "debt"
        static let customer = "customer"
        
    }
    
    var cashbox: Data? {
        get { return data(forKey: Keys.cashbox) }
        set { setValue(newValue, forKey: Keys.cashbox) }
    }
    var debt: Data? {
        get { return data(forKey: Keys.debt) }
        set { setValue(newValue, forKey: Keys.debt) }
    }
    var customer: Data? {
        get { return data(forKey: Keys.customer) }
        set { setValue(newValue, forKey: Keys.customer) }
    }

}
