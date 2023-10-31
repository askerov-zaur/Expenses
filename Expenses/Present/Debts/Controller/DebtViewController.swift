//
//  DebtViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class DebtViewController: UIViewController {
    
    private lazy var viewModel: DebtViewModel = {
        let view = DebtViewModel(session: .shared)
        
        return view
    }()
    
    private lazy var tableView: UITableView = {
       let table = UITableView()
        table.separatorStyle = .none
        table.dataSource = self
        table.delegate = self
        table.register(DebtTableCell.self, forCellReuseIdentifier: DebtTableCell.description())
        table.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configVC()
        setupUITable()
    }
    
    private func setupUITable() {
        view.anchor(view: tableView) { kit in
            kit.leading()
            kit.trailing()
            kit.top(16,safe: true)
            kit.bottom()
        }
    }
    
    private func configVC() {
        title = "Borclar"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddDebt))
    }
    
    @objc func didTapAddDebt() {
        let vc = AddDebtViewController()
        vc.viewModel.deleget = self
        vc.hidesBottomBarWhenPushed = true
        show(vc, sender: nil)
    }
}

extension DebtViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DebtTableCell.description(), for: indexPath) as? DebtTableCell else {return UITableViewCell()}
        cell.item = viewModel.getData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetail(index: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        95
    }
    
    func showDetail(index: Int) {
        viewModel.setIndex(index: index)
        let vc = DebtDetailViewController()
        vc.viewModel.deleget = self
        vc.sheetPresentationController?.prefersGrabberVisible = true
        vc.sheetPresentationController?.preferredCornerRadius = 30
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                self.view.frame.height/1.7
            })]
        }
        if !viewModel.getData[viewModel.getIndex].data.isEmpty {
            present(vc, animated: true)
        } else {
            print("Bosdur")
        }
        
    }
}

extension DebtViewController: AddDebtDeleget {
    func reload() {
        tableView.reloadData()
    }
}

extension DebtViewController: DebtDetailDeleget {
    func reloadData() {
        tableView.reloadData()
    }
    
    func dismiss() {
        print("Dismis debt list")
    }
}


