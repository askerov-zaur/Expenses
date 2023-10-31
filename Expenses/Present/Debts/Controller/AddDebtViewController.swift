//
//  AddDebtViewController.swift
//  Expenses
//
//  Created by Zaur Askerov on 23.10.23.
//

import UIKit

class AddDebtViewController: UIViewController {
    
    let viewModel: AddDebtViewModel = {
        let model = AddDebtViewModel(session: .shared)
        return model
    }()
    
    private lazy var customerText = CustomTextField(labelText: "Müştərini seçin", doneAccessory: true, inputView: customPickerView, tintColor: .clear)
    private let amountText = CustomTextField(labelText: "Məbləği yazın")
    private lazy var currencyText = CustomTextField(labelText: "Valyutanı seçin", doneAccessory: true, inputView: currencyPickerView, tintColor: .clear)
    
    private let noteText = CustomTextField(labelText: "Qeyd yazın")
    
    private lazy var customPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 1
        return picker
    }()
    
    private lazy var currencyPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 0
        return picker
    }()
    
    private let addDebtButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Borc yarat", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerText.delegate = self
        configVC()
        setupUI()
    }
    
    @objc func didTapAdd() {
        guard let customer = customerText.text, !customer.isEmpty else {return}
        guard let amount = amountText.text, !amount.isEmpty else {return}
        guard let currency = currencyText.text, !currency.isEmpty else {return}
        guard let note = noteText.text, !note.isEmpty else {return}
        guard let doubleAmount = Double(amount) else {return}
        guard let unwrapedCurrency = CurrencyType(rawValue: currency) else {return}
        let id = viewModel.getDataCustomer[viewModel.getDataCustomerIndex].id
        let data = [DebtDetailModel(currency: unwrapedCurrency, amount: doubleAmount, note: note, date: viewModel.getDate, hour: viewModel.getHour),]
        let item: DebtModel = DebtModel(fullname: customer, id: id , data: data )
        
        viewModel.setData(item: item)
        viewModel.deleget?.reload()
        clearText()
        navigationController?.popViewController(animated: true)
    }
    
    private func configVC() {
        title = "Yeni borc"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
    }
    
    private func clearText() {
        
        [customerText,
         amountText,
         noteText,
         currencyText
        ].forEach {$0.text = nil}
        currencyText.becomeFirstResponder()
    }
    
    private func setupUI() {
        
        view.anchor(view: customerText) { kit in
            kit.top(50,safe: true)
            kit.leading(24)
            kit.trailing(24)
            kit.height(80)
        }
        view.anchor(view: amountText) { kit in
            kit.top(customerText.bottomAnchor, 20)
            kit.leading(24)
            kit.trailing(24)
            kit.height(80)
        }
        view.anchor(view: currencyText) { kit in
            kit.top(amountText.bottomAnchor, 20)
            kit.leading(24)
            kit.trailing(24)
            kit.height(80)
        }
        view.anchor(view: noteText) { kit in
            kit.top(currencyText.bottomAnchor, 20)
            kit.leading(24)
            kit.trailing(24)
            kit.height(80)
        }
        view.anchor(view: addDebtButton) { kit in
            kit.bottom(60)
            kit.leading(24)
            kit.trailing(24)
            kit.height(50)
        }
    }
}

extension AddDebtViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return viewModel.getCurrencyData.count
        } else {
            return viewModel.getDataCustomer.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            currencyText.text = viewModel.getCurrencyData[row]
        } else {
            customerText.text = "\(viewModel.getDataCustomer[row].surname) \(viewModel.getDataCustomer[row].name)"
            viewModel.setIndex(index: row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return viewModel.getCurrencyData[row]
        } else {
            return "\(viewModel.getDataCustomer[row].name) \(viewModel.getDataCustomer[row].surname)"
        }
    }
    
}

extension AddDebtViewController: CustomTextDelegate {
    func changeValue() {
        
    }
    
    
}
