//
//  CustomersViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CustomersViewController: UIViewController {
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
        a()
    }
    
    private func setupView() {
        title = "Müştərilər"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    @objc func didTapAdd() {
        let vc = AddViewController()
        let nc = UINavigationController(rootViewController: vc)
        if let sheet = nc.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                return 300
            })]
            sheet.preferredCornerRadius = 20
        }
        present(nc, animated: true)
    }
    
    func a() {
        view.inputViewController?.modalPresentationStyle = .formSheet
        let sheet = view.inputViewController?.sheetPresentationController
        let multiplier = 0.25
        let fraction = UISheetPresentationController.Detent.custom { context in
            self.view.frame.height * multiplier
        }
        sheet?.detents = [fraction]
    }

    
}

extension CustomersViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
