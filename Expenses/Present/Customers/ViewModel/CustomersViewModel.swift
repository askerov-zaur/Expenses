//
//  CustomersViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CustomersViewModel {
    
    private let session: Session
    
    init(session: Session) {
        self.session = session
    }
    
    var getData: [CustomerModel] {
        return session.customer
    }
    

    
}
