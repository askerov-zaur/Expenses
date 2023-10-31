//
//  CustomTextField.swift
//  Expenses
//
//  Created by Zaur Askerov on 24.10.23.
//

import UIKit

protocol CustomTextDelegate: AnyObject {
    func changeValue()
}

class CustomTextField: BaseView {
    
    
    weak var delegate: CustomTextDelegate?
    
    private var view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Müştəri seç"
        label.textColor = .subColor
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private var customTextField: UITextField = {
        var text = UITextField()
        text.borderStyle = .none
        return text
    }()
    
    var text: String? {
        get {
            return customTextField.text
        }
        set {
            customTextField.text = newValue
        }
    }
    
    convenience init(placeholder: String? = nil, labelText: String, doneAccessory: Bool = false, inputView: UIView? = nil, tintColor: UIColor? = nil) {
        self.init()
        
        label.text = labelText
        customTextField.placeholder = placeholder
        customTextField.doneAccessory = doneAccessory
        customTextField.inputView = inputView
        customTextField.tintColor = tintColor
        customTextField.addTarget(self, action: #selector(changeValue(_:)), for: .touchDown)
    }
    
    override func setupUI() {
        anchor(view: view) { kit in
            kit.top(30)
            kit.leading()
            kit.trailing()
            kit.bottom()
        }
        anchor(view: label) { kit in
            kit.top()
            kit.leading()
        }
        anchor(view: customTextField) { kit in
            kit.centerY(view.centerYAnchor)
            kit.leading(16)
            kit.trailing(16)
            kit.height(100)
        }
    }
    
    @objc private func changeValue(_ textField: UITextField) {
        delegate?.changeValue()
    }
    
}
