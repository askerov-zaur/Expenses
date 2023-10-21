//
//  ViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 20.10.23.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetupTabBarViews()
    }
    
    private func SetupTabBarViews() {
        let cashbox = UINavigationController(rootViewController: CashboxViewController())
        cashbox.tabBarItem = UITabBarItem(title: "Kassa", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        
        let debt = UINavigationController(rootViewController: DebtViewController())
        debt.tabBarItem = UITabBarItem(title: "Borclar", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        
        let customers = UINavigationController(rootViewController: CustomersViewController())
        customers.tabBarItem = UITabBarItem(title: "Müştərilər", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(title: "Ayarlar", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        
    viewControllers = [cashbox, debt, customers, settings]
        
    }

}

