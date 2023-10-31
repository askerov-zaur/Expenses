//
//  DebtTableCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 23.10.23.
//

import UIKit

class DebtTableCell: BaseTableViewCell {
    
    var item: DebtModel? {
        didSet {
            guard let item = item else {return}
            fullnameLabel.text = item.fullname
            configDetail(item: item)
        }
    }
    
    private let backgroundListView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    private let totalAZN: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let totalUSD: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private let totalEUR: UILabel = {
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
                kit.top(16)
                kit.leading(24)
                kit.height(18)
            }
            backgroundListView.anchor(view: totalAZN) { kit in
                kit.leading(24)
                kit.bottom(16)
                kit.height(17)
            }
            backgroundListView.anchor(view: totalUSD) { kit in
                kit.leading(totalAZN.trailingAnchor, 20)
                kit.bottom(16)
                kit.height(17)
            }
            backgroundListView.anchor(view: totalEUR) { kit in
                kit.leading(totalUSD.trailingAnchor, 20)
                kit.bottom(16)
                kit.height(17)
            }
        }
    }
    
    private func configDetail(item: DebtModel) {
        var totalAZN: Double = 0.0
        var totalUSD: Double = 0.0
        var totalEUR: Double = 0.0
        
        item.data.forEach { item in
            switch item.currency {
            case .AZN:
                totalAZN += item.amount
            case .USD:
                totalUSD += item.amount
            case .EUR:
                totalEUR += item.amount
            }
        }
    
        self.totalAZN.text = "\(totalAZN) ₼"
        self.totalEUR.text = "\(totalEUR) €"
        self.totalUSD.text = "\(totalUSD) $"
    }
    
}

