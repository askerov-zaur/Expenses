//
//  SettingsTableHeader.swift
//  Expenses
//
//  Created by Zaur Askerov on 24.10.23.
//

import UIKit

class SettingsTableHeader: BaseView {
    
    var text: String? {
        get {
            nameLabel.text
        }
        set{
            nameLabel.text = newValue
        }
    }
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Zaur Əsgerov"
        return label
    }()
    
    private let avatar: UIImageView = {
       let image = UIImageView()
        image.image = .avatar
        return image
    }()
    
    override func setupUI() {
        
        anchor(view: nameLabel) { kit in
            kit.bottom(27)
            kit.centerX()
            kit.height(22)
        }
        anchor(view: avatar) { kit in
            kit.bottom(nameLabel.topAnchor, 12)
            kit.centerX()
            kit.height(120)
            kit.width(123)
        }

    }
    
    
}
