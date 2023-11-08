//
//  ArchiveCashboxModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 04.11.23.
//

import Foundation

struct ArchiveModel: Codable {
    
    let date: Date
    var cashbox: [CashboxModel]
    
}
