//
//  CashboxCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import UIKit

class CashboxTableCell: BaseTableViewCell {
    
    var item: CashboxModel? {
        didSet {
            guard let item = item else {return}
            amountLabel.text = "\(item.amount)"
            currencyLabel.text = item.currency
            dateLabel.text = item.date
        }
    }
    
    private let backgroundListView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    private let amountLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let currencyLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override func setupCell() {
        contentView.anchor(view: backgroundListView) { kit in
            kit.top(15)
            kit.bottom(15)
            kit.leading(16)
            kit.trailing(16)
            
            anchor(view: amountLabel) { kit in
                kit.trailing(34)
                kit.centerY()
                kit.height(18)
            }
            
            anchor(view: dateLabel) { kit in
                kit.leading(32)
                kit.centerY()
                kit.height(18)
            }
        }
    }
    
}

