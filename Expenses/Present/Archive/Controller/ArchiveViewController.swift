//
//  ArchieveCashboxViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 04.11.23.
//

import UIKit

class ArchiveViewController: UIViewController {
    
    let viewModel: ArchieveViewModel = {
        let model = ArchieveViewModel(session: .shared, 
                                      repository: ArchieveRepesitory() )
        return model
    }()
    
    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(ArchiveTableCell.self, forCellReuseIdentifier: ArchiveTableCell.description())
        table.backgroundColor = .tabBackgroundColor
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tabBackgroundColor
        navigationController?.navigationBar.prefersLargeTitles = true
        title = " Arxiv"
        setupUI()
        viewModel.fetchData()
    }
    
    func setupUI() {
        view.anchor(view: table) { kit in
            kit.top(16,safe: true)
            kit.leading()
            kit.trailing()
            kit.bottom()
        }
    }
}

extension ArchiveViewController: TableViewDelegete {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getArchive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: ArchiveTableCell.description(), for: indexPath) as? ArchiveTableCell else {
            return UITableViewCell()
        }
        cell.items = viewModel.getArchive[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
}

