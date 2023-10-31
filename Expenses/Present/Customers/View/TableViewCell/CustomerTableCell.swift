//
//  CustomerTableCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 23.10.23.
//

import UIKit

class CustomerTableCell: BaseTableViewCell {
    
    var item: CustomerModel? {
        didSet {
            guard let item = item else {return}
            fullnameLabel.text = "\(item.name) \(item.surname)"
            phoneLabel.text = item.phoneNumber
        }
    }
    
    private let backgroundListView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        return view
    }()
    
    private lazy var callIconButton: UIButton = {
        let image = UIButton(type: .system)
        image.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        return image
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override func setupCell() {
        contentView.anchor(view: backgroundListView) { kit in
            kit.top(8)
            kit.bottom(8)
            kit.leading(24)
            kit.trailing(24)
            
            backgroundListView.anchor(view: fullnameLabel) { kit in
                kit.leading(24)
                kit.top(16)
                kit.height(18)
            }
            
            backgroundListView.anchor(view: phoneLabel) { kit in
                kit.top(fullnameLabel.bottomAnchor, 6)
                kit.leading(24)
                kit.height(18)
            }
//            backgroundListView.anchor(view: callIconButton) { kit in
//                kit.trailing(32)
//                kit.centerY()
//                kit.height(28)
//                kit.width(28)
//            }
        }
    }
    
}

