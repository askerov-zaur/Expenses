//
//  CustomersViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CustomersViewController: UIViewController {
    
    private let viewModel: CustomersViewModel = {
        let model = CustomersViewModel(session: .shared)
        return model
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.allowsSelection = false
        table.delegate = self
        table.dataSource = self
        table.register(CustomerTableCell.self, forCellReuseIdentifier: CustomerTableCell.description())
        table.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configVC()
        setupTable()
    }
    
    private func configVC() {
        title = "Müştərilər"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let vc = AddCustomerViewController()
        vc.viewModel.delegate = self
        vc.hidesBottomBarWhenPushed = true
        show(vc, sender: nil)
    }
    
    private func setupTable() {
        view.anchor(view: table) { kit in
            kit.leading()
            kit.trailing()
            kit.top(16,safe: true)
            kit.bottom()
        }
    }
}

extension CustomersViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: CustomerTableCell.description(), for: indexPath) as? CustomerTableCell else {return UITableViewCell()}
        cell.item = viewModel.getData[indexPath.row]
                return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}

extension CustomersViewController: AddDelegate {
    func reload() {
        table.reloadData()
    }
}
