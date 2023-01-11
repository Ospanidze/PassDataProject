//
//  ViewController.swift
//  PassDataProject
//
//  Created by Айдар Оспанов on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let projectLabel: UILabel = {
        let label = UILabel()
        label.text = "Pass Data project"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let twoTextTF = TwoTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        setupView()
        setConstraints()
    }

    func setupView() {
        view.addSubview(projectLabel)
        view.addSubview(loginButton)
        view.addSubview(twoTextTF)
    }
    
    @objc func enterAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "NewVC") as? NewPageViewController {
            vc.login = twoTextTF.loginTF.text == "" ? "Guest" : twoTextTF.loginTF.text
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true)
        }
    }
    
}

extension ViewController {
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            projectLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            projectLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            projectLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            twoTextTF.topAnchor.constraint(equalTo: projectLabel.bottomAnchor, constant: 120),
            twoTextTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            twoTextTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            twoTextTF.heightAnchor.constraint(equalToConstant: 110),

            loginButton.topAnchor.constraint(equalTo: twoTextTF.bottomAnchor, constant: 100),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
