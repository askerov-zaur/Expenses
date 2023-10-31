//
//  DebtModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import Foundation

struct DebtModel: Codable {
    let fullname: String
    let id: String
    var data: [DebtDetailModel]
}



