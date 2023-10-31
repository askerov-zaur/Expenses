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
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        SetupTabBarViews()
    }
    
    private func SetupTabBarViews() {
        
        let cashbox = UINavigationController(rootViewController: CashboxViewController())
        cashbox.tabBarItem = UITabBarItem(title: "Kassa", image:.cashbox, selectedImage:.cashboxFill)
        
        let debt = UINavigationController(rootViewController: DebtViewController())
        debt.tabBarItem = UITabBarItem(title: "Borclar", image: .debt, selectedImage: .debtFill)
        
        let customers = UINavigationController(rootViewController: CustomersViewController())
        customers.tabBarItem = UITabBarItem(title: "Müştərilər", image: .customers, selectedImage: .customersFill)
        
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(title: "Ayarlar", image: .settings, selectedImage: .settingsFill)
        
    viewControllers = [cashbox, debt, customers, settings]
        
    }

}

