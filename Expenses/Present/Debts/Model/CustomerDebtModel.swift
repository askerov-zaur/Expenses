//
//  CustomerDebtModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

struct CustomerDebtModel: Codable  {
    
    let customer: CustomerModel
    let debt: [DebtModel]
    
}
