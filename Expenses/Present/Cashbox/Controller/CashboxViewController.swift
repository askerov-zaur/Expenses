//
//  CashboxViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CashboxViewController: UIViewController {
    
    let viewModel: CashboxViewModel = {
        let model = CashboxViewModel(session: .shared)
        return model
    }()
    
    private let totalBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 6
        return view
    }()
    
    private lazy var totalAmountView: CashboxTotalAmountView = {
        var view = CashboxTotalAmountView()
        view.items = viewModel.getDataCashboxData
        return view
    }()
    
    private let segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["AZN", "USD", "EUR"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(tapSegment(_:)), for: .valueChanged)
        return segment
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.dataSource = self
        table.delegate = self
        table.register(CashboxTableCell.self, forCellReuseIdentifier: CashboxTableCell.description())
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .white
        table.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        table.layer.shadowOffset = CGSize(width: 0, height: 0)
        table.layer.shadowOpacity = 1
        table.layer.shadowRadius = 8
        table.layer.cornerRadius = 18
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Kassa"
        
        setupUI()
        viewModel.setEmpty[0].data = viewModel.getDataCashboxData[0].data
    }
        
    @objc func tapSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModel.setEmpty[0].data = viewModel.getDataCashboxData[0].data
        case 1:
            viewModel.setEmpty[0].data = viewModel.getDataCashboxData[1].data
        case 2:
            viewModel.setEmpty[0].data = viewModel.getDataCashboxData[2].data
        default:
            fatalError()
        }
        tableView.reloadData()
    }
    
    func setupUI() {
        view.anchor(view: totalBackgroundView) { kit in
            kit.leading(24)
            kit.trailing(24)
            kit.top(24,safe: true)
            kit.height(120)
        }
        totalBackgroundView.anchor(view: totalAmountView) { kit in
            kit.top()
            kit.bottom()
            kit.trailing()
            kit.leading()
        }
        view.anchor(view: segment) { kit in
            kit.leading(24)
            kit.trailing(24)
            kit.top(totalBackgroundView.bottomAnchor,40)
            kit.height(50)
        }
        view.anchor(view: tableView) { kit in
            kit.top(segment.bottomAnchor,30)
            kit.bottom()
            kit.leading(24)
            kit.trailing(24)
        }
    }
}

extension CashboxViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.setEmpty[0].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CashboxTableCell.description(), for: indexPath) as? CashboxTableCell else {return UITableViewCell()}
        cell.item = viewModel.setEmpty[0].data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
}
