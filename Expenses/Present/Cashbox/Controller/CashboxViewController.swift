//
//  CashboxViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CashboxViewController: UIViewController {
    
    let viewModel: CashboxViewModel = {
       let model = CashboxViewModel()
        return model
    }()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.allowsSelection = false
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.register(CashboxTableCell.self, forCellReuseIdentifier: CashboxTableCell.description())
        return table
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Kassa"
        
        setupUI()
    }
    
    func setupUI() {
        view.anchorFill(view: tableView)
    }
    
    
}

extension CashboxViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.session.detail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CashboxTableCell.description(), for: indexPath) as? CashboxTableCell else {return UITableViewCell()}
        cell.item = viewModel.session.detail[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}
