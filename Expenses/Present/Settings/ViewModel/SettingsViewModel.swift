//
//  SettingsViewModel.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class SettingsViewModel {
    
    private var session: Session
    
    init(session: Session) {
        self.session = .shared
    }
    
    var getData: [SettingsModel] {
        return session.settingModel
    }
    
}
