//
//  AddViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 21.10.23.
//

import UIKit

class AddCustomerViewController: UIViewController {
    
    let viewModel: AddCustomerViewModel = {
        let model = AddCustomerViewModel(session: .shared)
        return model
    }()
    
    private let surnameText = CustomTextField(labelText: "Soyadınızı yazın")
    private let nameText = CustomTextField(labelText: "Adınızı yazın")
    private let phoneText = CustomTextField(labelText: "Nömrənizi yazın")
    
    private lazy var addCustomerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Əlavə et", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddVC()
        configAddVC()
    }
    
    private func configAddVC() {
        title = "Yeni müştəri"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
    }
    
    @objc func didTapSave() {
        guard let name = nameText.text, !name.isEmpty else {return}
        guard let surname = surnameText.text, !surname.isEmpty else {return}
        guard let phone = phoneText.text, !phone.isEmpty else {return}
        let id = viewModel.getID
        
        viewModel.setData(input: CustomerModel(id: id, name: name, surname: surname, phoneNumber: phone))
        viewModel.delegate?.reload()
    }

    private func setupAddVC() {
        
        view.anchor(view: surnameText) { kit in
            kit.leading(24)
            kit.top(50, safe: true)
            kit.height(80)
            kit.trailing(24)
        }
        view.anchor(view: nameText) { kit in
            kit.leading(24)
            kit.top(surnameText.bottomAnchor, 20)
            kit.height(80)
            kit.trailing(24)
        }
        view.anchor(view: phoneText) { kit in
            kit.leading(24)
            kit.top(nameText.bottomAnchor, 20)
            kit.height(80)
            kit.trailing(24)
        }
        view.anchor(view: addCustomerButton) { kit in
            kit.leading(24)
            kit.bottom(60)
            kit.height(50)
            kit.trailing(24)
        }

    }
}

