//
//  ArchiveTableCell.swift
//  Expenses
//
//  Created by Zaur Askerov on 05.11.23.
//

import UIKit

class ArchiveTableCell: BaseTableViewCell {
    
    var items: ArchiveModel? {
        didSet {
            guard let items = items else {return}
            dateLabel.text = "\(formatData(inputData: items.date))" 
            findTotal(items: items)
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
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemBlue
        return label
    }()
    
    private let aznLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    private let usdLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    private let eurLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        
        return label
    }()
    
    private let aznIcon: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .subTitleColor
        label.text = "₼"
        return label
    }()
    
    private let usdIcon: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .subTitleColor
        label.text = "$"
        return label
    }()
    
    private let eurIcon: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .subTitleColor
        label.text = "€"
        return label
    }()
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [aznIcon,usdIcon,eurIcon,])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 20
        stack.alignment = .fill
        return stack
    }()
    
    override func setupCell() {
        backgroundColor = .tabBackgroundColor
        
        contentView.anchor(view: backgroundListView) { kit in
            kit.top(8)
            kit.bottom(8)
            kit.leading(24)
            kit.trailing(24)
        }
        backgroundListView.anchor(view: dateLabel) { kit in
            kit.leading(20)
            kit.top(16)
        }
        backgroundListView.anchor(view: hStack) { kit in
            kit.leading(24)
            kit.trailing(24)
            kit.bottom(16)
        }
        anchor(view: aznLabel) { kit in
            kit.leading(aznIcon.leadingAnchor, 20)
            kit.centerY(hStack.centerYAnchor)
        }
        anchor(view: usdLabel) { kit in
            kit.leading(usdIcon.leadingAnchor, 20)
            kit.centerY(hStack.centerYAnchor)
        }
        anchor(view: eurLabel) { kit in
            kit.leading(eurIcon.leadingAnchor, 20)
            kit.centerY(hStack.centerYAnchor)
        }
        
    }
    
    private func findTotal(items: ArchiveModel ) {
        
        var totalAZN = 0.0
        var totalUSD = 0.0
        var totalEUR = 0.0
        
        items.cashbox.forEach { cashbox in
            switch cashbox.currency {
            case .AZN:
                cashbox.data.forEach({ CashboxData in
                    totalAZN += CashboxData.amount
                })
            case .USD:
                cashbox.data.forEach({ CashboxData in
                    totalUSD += CashboxData.amount
                })
            case .EUR:
                cashbox.data.forEach({ CashboxData in
                    totalEUR += CashboxData.amount
                })
            }
            aznLabel.text = "\(totalAZN)"
            usdLabel.text = "\(totalUSD)"
            eurLabel.text = "\(totalEUR)"
        }
    }
    
    private func formatData(inputData: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM y : m-ss"
        dateFormatter.locale = Locale(identifier: "Az_Latn")
        let date = dateFormatter.string(from: inputData)
        return date
    }

}
