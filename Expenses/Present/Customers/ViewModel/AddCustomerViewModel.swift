//
//  AddViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

protocol AddDelegate: AnyObject {
    func reload()
}

class AddCustomerViewModel {
    
    weak var delegate: AddDelegate?
    private var id = UUID().uuidString
    
    private var session: Session
    init(session: Session) {
        self.session = session
    }
    
    func setData(input: CustomerModel) {
        session.addCustomer(inputCustomerInfo: input)
    }
    
    var getID: String {
        return id
    }
}
