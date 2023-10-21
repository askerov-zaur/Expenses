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
        cashbox.tabBarItem = UITabBarItem(title: "Kassa", image: UIImage(named: "bag"), selectedImage: UIImage(named: "bag.fill"))
        
        let debt = UINavigationController(rootViewController: DebtViewController())
        debt.tabBarItem = UITabBarItem(title: "Borclar", image: UIImage(systemName: "list.bullet.rectangle"), selectedImage: UIImage(systemName: "list.bullet.rectangle.fill"))
        
        let customers = UINavigationController(rootViewController: CustomersViewController())
        customers.tabBarItem = UITabBarItem(title: "Müştərilər", image: UIImage(systemName: "person.2"), selectedImage: UIImage(systemName: "person.2.fill"))
        
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(title: "Ayarlar", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        
    viewControllers = [cashbox, debt, customers, settings]
        
    }

}

