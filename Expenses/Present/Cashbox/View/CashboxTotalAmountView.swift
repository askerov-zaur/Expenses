//
//  CashboxTotalAmountView.swift
//  Expenses
//
//  Created by Zaur Askerov on 29.10.23.
//

import UIKit

class CashboxTotalAmountView: BaseView {
    
    var items: [CashboxModel]? {
        didSet {
            guard let items = items else {return}
            findSum(items: items)
        }
    }
    
    private var totalBackgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    private let totalAznLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .titleColor
        label.text = "₼"
        return label
    }()
    
    private let totalUsdLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .titleColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "$"
        return label
    }()

    private let totalEurLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .titleColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "€"
        return label
    }()
    
    private let aznSubTitle: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let usdSubTitle: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let eurSubTitle: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var hStack: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [totalAznLabel,totalUsdLabel,totalEurLabel])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .equalCentering
        stack.alignment = .center
        return stack
    }()

    override func setupUI() {
        anchor(view: hStack) { kit in
            kit.top(24)
            kit.trailing(50)
            kit.leading(50)
        }
        anchor(view: aznSubTitle) { kit in
            kit.top(hStack.bottomAnchor,8)
            kit.centerX(totalAznLabel.centerXAnchor)
        }
        anchor(view: usdSubTitle) { kit in
            kit.top(hStack.bottomAnchor,8)
            kit.centerX(totalUsdLabel.centerXAnchor)
        }
        anchor(view: eurSubTitle) { kit in
            kit.top(hStack.bottomAnchor,8)
            kit.centerX(totalEurLabel.centerXAnchor)
        }
    }
    
    private func findSum(items:[CashboxModel]) {
        var totalAZN = 0.0
        var totalUSD = 0.0
        var totalEUR = 0.0
        items.forEach { CashboxModel in
            switch CashboxModel.currency {
            case .AZN:
                CashboxModel.data.forEach { data in totalAZN += data.amount }
            case .USD:
                CashboxModel.data.forEach { data in totalUSD += data.amount }
            case .EUR:
                CashboxModel.data.forEach { data in totalEUR += data.amount }
            }
        }
        aznSubTitle.text = "\(totalAZN)"
        usdSubTitle.text = "\(totalUSD)"
        eurSubTitle.text = "\(totalEUR)"
    }
}
