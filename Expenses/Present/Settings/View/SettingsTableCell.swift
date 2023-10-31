//
//  SettingsTableCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 24.10.23.
//

import UIKit

class SettingsTableCell: BaseTableViewCell {
    
    var item: SettingsModel? {
        didSet {
            guard let item = item else {return}
            icons.image = UIImage(named: item.icon)
            listNamesLabel.text = item.name
        }
    }
    
    private let icons: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let listNamesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .titleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupCell() {
        backgroundColor = .white
        contentView.anchor(view: icons) { kit in
            kit.centerY()
            kit.leading(16)
            kit.height(28)
            kit.width(28)
        }
        contentView.anchor(view: listNamesLabel) { kit in
            kit.leading(icons.trailingAnchor, 16)
            kit.centerY()
            kit.height(20)
        }
    }
    
    
}
