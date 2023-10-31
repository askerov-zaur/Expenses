//
//  CashboxCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import UIKit

class CashboxTableCell: BaseTableViewCell {
    
    var item: CashboxData? {
        didSet {
            guard let item = item else {return}
            amountLabel.text = "\(item.amount)"
            dateLabel.text = item.date.description
            hourLabel.text = item.hour.description
        }
    }
    
    private let backgroundListView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let amountLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let hourLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .subColor
        label.text = "12:67"
        return label
    }()
    
    override func setupCell() {
        contentView.anchor(view: backgroundListView) { kit in
            kit.top(0)
            kit.bottom(0)
            kit.leading(0)
            kit.trailing(0)
            
            backgroundListView.anchor(view: amountLabel) { kit in
                kit.trailing(20)
                kit.centerY()
                kit.height(18)
            }
            
            backgroundListView.anchor(view: dateLabel) { kit in
                kit.leading(20)
                kit.centerY(-10)
                kit.height(18)
            }
            backgroundListView.anchor(view: hourLabel) { kit in
                kit.leading(20)
                kit.centerY(10)
                kit.height(18)
            }
        }
    }
    
}

