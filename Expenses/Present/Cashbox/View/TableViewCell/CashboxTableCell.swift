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
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowOpacity = 5
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
            kit.top(8)
            kit.bottom(8)
            kit.leading(16)
            kit.trailing(16)
            
            anchor(view: amountLabel) { kit in
                kit.trailing(34)
                kit.top(centerYAnchor)
                kit.height(18)
            }
        }
    }
    
}

