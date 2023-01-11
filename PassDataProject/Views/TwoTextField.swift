//
//  TwoTextField.swift
//  PassDataProject
//
//  Created by Айдар Оспанов on 11.01.2023.
//

import UIKit

class TwoTextField: UIView {
    
    let loginTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "login"
        textField.font = UIFont(name: "Alex Next", size: 20)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loginTF)
        addSubview(passwordTF)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            loginTF.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            loginTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            loginTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            loginTF.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            passwordTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            passwordTF.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
