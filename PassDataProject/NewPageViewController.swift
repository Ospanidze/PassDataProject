//
//  NewPageViewController.swift
//  PassDataProject
//
//  Created by Айдар Оспанов on 05.01.2023.
//

import UIKit

class NewPageViewController: UIViewController {
    
    var login: String?
    
    let label = UILabel()
    let goBackButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemTeal
        
        view.addSubview(label)
        view.addSubview(goBackButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        goBackButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            goBackButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            goBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackButton.heightAnchor.constraint(equalToConstant: 50),
            goBackButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        
        guard let login = login else { return }
        
        label.text = "Hello, \(login)"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 35)
        label.tintColor = .white
        
        goBackButton.setTitle("Go back", for: .normal)
        goBackButton.setTitleColor(.black, for: .normal)
        goBackButton.layer.backgroundColor = UIColor.white.cgColor
        goBackButton.layer.cornerRadius = 15
        goBackButton.addTarget(self, action: #selector(goBackAction(sender:)), for: .touchUpInside)
        
    
    }
    
    @objc func goBackAction(sender: UIButton) {
        dismiss(animated: true)
    }

}
