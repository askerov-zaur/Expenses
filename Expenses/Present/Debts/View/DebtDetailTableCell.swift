//
//  DebtDetailTableCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import UIKit

class DebtDetailTableCell: BaseTableViewCell {
    
    var item : DebtDetailModel? {
        didSet {
            guard let item = item else {return}
            noteLabel.text = item.note
            dateLabel.text = item.date.description
            addCurrencyEnding(item: item)
            longNote()
        }
    }
    
    private let noteLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let totalAZNLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let totalUSDLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let totalEURLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    
    override func setupCell() {
        
        contentView.anchor(view: noteLabel) { kit in
            kit.leading(24)
            kit.trailing(120)
            kit.top(16)
            kit.height(19)
        }
        contentView.anchor(view: dateLabel) { kit in
            kit.top(noteLabel.bottomAnchor, 8)
            kit.leading(noteLabel.leadingAnchor)
            kit.height(17)
        }
        contentView.anchor(view: amountLabel) { kit in
            kit.centerY()
            kit.trailing(24)
            kit.height(19)
        }
    }
    
    func longNote() {
        if noteLabel.text!.count > 32 {
            
            noteLabel.removeFromSuperview()
            dateLabel.removeFromSuperview()
            amountLabel.removeFromSuperview()
            //Table row 120 vermek
            contentView.anchor(view: noteLabel) { kit in
                kit.leading(24)
                kit.trailing(120)
                kit.centerY()
                kit.bottom(24)
            }
            contentView.anchor(view: dateLabel) { kit in
                kit.top(noteLabel.bottomAnchor, -8)
                kit.leading(noteLabel.leadingAnchor)
                kit.height(17)
            }
            contentView.anchor(view: amountLabel) { kit in
                kit.centerY()
                kit.trailing(24)
                kit.height(19)
            }
        }
    }
    
    private func addCurrencyEnding(item: DebtDetailModel) {
        switch item.currency {
        case .AZN:
            amountLabel.text = "\(item.amount) ₼"
        case .USD:
            amountLabel.text = "\(item.amount) $"
        case .EUR:
            amountLabel.text = "\(item.amount) €"
        }
    }
}

