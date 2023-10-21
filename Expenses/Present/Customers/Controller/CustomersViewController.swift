//
//  CustomersViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CustomersViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Müştərilər"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
}
