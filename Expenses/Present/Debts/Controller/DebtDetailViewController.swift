//
//  DebtDetailViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 25.10.23.
//

import UIKit

class DebtDetailViewController: UIViewController {
    
    let viewModel: DebtDetailViewModel = {
        let model = DebtDetailViewModel(session: .shared)
        return model
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(DebtDetailTableCell.self, forCellReuseIdentifier: DebtDetailTableCell.description())
        table.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        table.tableFooterView = footer
        return table
    }()
    
    private lazy var fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Borc silmək üçün cədvəldən seçim et"
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var footer: DebtDetailTableFooter = {
        let view = DebtDetailTableFooter()
        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 100)
        view.item = viewModel.getData
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        setupUI()
        setLabelTitle()
        
    }
    
    func setupUI() {
        
        view.anchor(view: fullnameLabel) { kit in
            kit.top(40)
            kit.centerX()
            kit.height(26)
        }
        view.anchor(view: infoLabel) { kit in
            kit.top(fullnameLabel.bottomAnchor, 10)
            kit.centerX()
            kit.height(17)
        }
        view.anchor(view: table) { kit in
            kit.top(infoLabel.bottomAnchor, 30)
            kit.leading()
            kit.bottom()
            kit.trailing()
        }
    }
    
    func setLabelTitle() {
        fullnameLabel.text = viewModel.getDataFullname[viewModel.getIndex].fullname
    }
    
}

extension DebtDetailViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: DebtDetailTableCell.description(), for: indexPath) as? DebtDetailTableCell else {return UITableViewCell()}
        cell.item = viewModel.getData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        popUp(amount: viewModel.getData[indexPath.row].amount, index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func popUp(amount: Double, index: Int) {
        viewModel.deleget = self
        let popVC = UIAlertController(title: "Ödənilən məbləğ", message: "", preferredStyle: .alert)
        popVC.addTextField { text in
            text.text = "\(amount)"
            popVC.message = "Məbləğ əsas borcdan cıxılacaq: \(amount) \(self.viewModel.getData[index].currency)"
        }
        let cancelAction = UIAlertAction(title: "Ləğv et", style: .cancel)
        let okAction = UIAlertAction(title: "Tamam", style: .default) { _ in
            guard let text = popVC.textFields?[0].text else { return }
            guard let amount = Double(text) else { return }
            self.viewModel.appendAmount(index: index, amount: amount)
        }
        popVC.addAction(cancelAction)
        popVC.addAction(okAction)
        present(popVC, animated: true)
    }
}

extension DebtDetailViewController: DebtDetailDeleget {
    func reloadData() {
        table.reloadData()
        footer.item = self.viewModel.getData
    }

    func dismiss() {
        self.dismiss(animated: true)
    }
}
