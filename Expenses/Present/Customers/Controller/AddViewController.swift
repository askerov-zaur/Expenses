//
//  AddViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import UIKit

class AddViewController: UIViewController {
    
    private let viewModel: AddViewModel = {
       let model = AddViewModel()
        return model
    }()
    
    private let surnameText: UITextField = {
        let name = UITextField()
        name.borderStyle = .roundedRect
        name.placeholder = "Soyadınızı yazın"
        return name
    }()
    
    private let nameText: UITextField = {
        let name = UITextField()
        name.borderStyle = .roundedRect
        name.placeholder = "Adınızı yazın"
        return name
    }()
    
    private let phoneText: UITextField = {
        let name = UITextField()
        name.borderStyle = .roundedRect
        name.placeholder = "Nömrənizi yazın"
        return name
    }()
    
//    private lazy var saveButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.tintColor = .white
//        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
//        button.layer.cornerRadius = 12
//        button.backgroundColor = .systemBlue
//        button.setTitle("Əlavə et", for: .normal)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddVC()
        configAddVC()
    }
    
    func configAddVC() {
        title = "Yeni müştəri"
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cancel"), style: .done, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "done"), style: .done, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        
    }
    
    @objc func didTapClose() {
        dismiss(animated: true)
    }
    
    func setupAddVC() {
        
        view.anchor(view: surnameText) { kit in
            kit.leading(30)
            kit.top(20, safe: true)
            kit.height(50)
            kit.trailing(30)
        }
        
        view.anchor(view: nameText) { kit in
            kit.leading(30)
            kit.top(surnameText.bottomAnchor, 16)
            kit.height(50)
            kit.trailing(30)
        }
        
        view.anchor(view: phoneText) { kit in
            kit.leading(30)
            kit.top(nameText.bottomAnchor, 16)
            kit.height(50)
            kit.trailing(30)
        }
        
//        view.anchor(view: saveButton) { kit in
//            kit.leading(30)
//            kit.top(phoneText.bottomAnchor, 27)
//            kit.height(50)
//            kit.trailing(30)
//        }
    }
}

