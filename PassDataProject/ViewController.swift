//
//  ViewController.swift
//  PassDataProject
//
//  Created by Айдар Оспанов on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let projectLabel = UILabel()
    let loginTF = UITextField()
    let passwordTF = UITextField()
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        setupView()
        setConstraints()
       
        
    }

    func setupView() {
        let UIElements = [projectLabel, loginTF, passwordTF, loginButton]
        UIElements.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            projectLabel.text = "Pass Data project"
            projectLabel.numberOfLines = 0
            projectLabel.textAlignment = .center
            projectLabel.font = .systemFont(ofSize: 45)
            
            loginTF.placeholder = "login"
            loginTF.backgroundColor = .white
            
            passwordTF.placeholder = "Password"
            passwordTF.backgroundColor = .white
            passwordTF.isSecureTextEntry = true
            
            loginButton.setTitle("Login", for: .normal)
            loginButton.setTitleColor(.black, for: .normal)
            loginButton.layer.backgroundColor = UIColor.white.cgColor
            loginButton.layer.cornerRadius = 10
            loginButton.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
        }
    }
    
    @objc func enterAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "NewVC") as? NewPageViewController {
            vc.login = loginTF.text == "" ? "Guest" : loginTF.text
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true)
        }
        
    }
    
}

extension ViewController {
    func setConstraints() {
        
        let stackViewForTF = UIStackView(arrangedSubviews: [loginTF, passwordTF])
        stackViewForTF.spacing = 15
        stackViewForTF.axis = .vertical
        view.addSubview(stackViewForTF)
        
        stackViewForTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            projectLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            projectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            projectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            stackViewForTF.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: 120),
            stackViewForTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackViewForTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            loginButton.topAnchor.constraint(equalTo: stackViewForTF.bottomAnchor, constant: 250),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
