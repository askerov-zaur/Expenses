//
//  DebtDetailFooter.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import UIKit

class DebtDetailTableFooter: BaseView {
    
    var item: [DebtDetailModel]? {
        didSet {
            guard let item = item else {return}
            getCurrencyData(item: item)
        }
    }
    
    private lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalAZNLabel,totalEURLabel,totalUSDLabel])
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let totalNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Toplam"
        label.textColor = .subColor
        label.font = .systemFont(ofSize: 17, weight: .regular)
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
    
    override func setupUI() {
        
        anchor(view: hStack) { kit in
            kit.trailing(24)
            kit.centerY()
        }
        anchor(view: totalNameLabel) { kit in
            kit.leading(24)
            kit.centerY()
            kit.height(19)
        }
        
    }
    
    func getCurrencyData(item: [DebtDetailModel]) {
        
        var totalAZN: Double = 0.0
        var totalUSD: Double = 0.0
        var totalEUR: Double = 0.0
        
        item.forEach { model in
            switch model.currency {
            case .AZN:
                totalAZN += model.amount
            case .USD:
                totalUSD += model.amount
            case .EUR:
                totalEUR += model.amount
            }
        }
        
        self.totalAZNLabel.text = "\(totalAZN)"
        self.totalUSDLabel.text = "\(totalUSD)"
        self.totalEURLabel.text = "\(totalEUR)"
    }
}
