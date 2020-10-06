//
//  ViewController.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var controller: LoginController?
    
    private var registerButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        prepareLayout()
        
        registerButton.setTitle("Se registrar", for: .normal)
        registerButton.addTarget(
            self,
            action: #selector(didTapRegisterButton),
            for: .touchUpInside
        )
    }
    
    @objc private func didTapRegisterButton() {
        self.controller?.didTapRegisterButton()
    }
    
    private func prepareLayout() {
        view.backgroundColor = .systemTeal
        view.addSubview(registerButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}

