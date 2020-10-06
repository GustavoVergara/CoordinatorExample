//
//  LoginFactory.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

protocol AuthFactoryProtocol {
    func makeAuthCoordinator(router: Router) -> AuthCoordinator
    func makeLoginViewController(coordinator: AuthCoordinatorProtocol) -> ViewController
    func makeRegisterViewController(coordinator: AuthCoordinatorProtocol) -> ViewController
}

struct AuthFactory: AuthFactoryProtocol {
    
    func makeAuthCoordinator(router: Router) -> AuthCoordinator {
        AuthCoordinator(router: router, authFactory: self)
    }
    
    func makeLoginViewController(coordinator: AuthCoordinatorProtocol) -> ViewController {
        let loginVC = LoginViewController()
        loginVC.controller = LoginController(coordinator: coordinator)
        return loginVC.eraseToViewController()
    }
    
    func makeRegisterViewController(coordinator: AuthCoordinatorProtocol) -> ViewController {
        let registerVC = RegisterViewController()
        return registerVC.eraseToViewController()
    }
    
}
