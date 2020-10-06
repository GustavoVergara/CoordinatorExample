//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

protocol AuthCoordinatorProtocol: Coordinator {
    func presentRegister()
}

class AuthCoordinator: AuthCoordinatorProtocol {
    
    let router: Router
    let authFactory: AuthFactoryProtocol
    
    init(
        router: Router,
        authFactory: AuthFactoryProtocol = AuthFactory()
    ) {
        self.router = router
        self.authFactory = authFactory
    }
    
    // MARK: - Coordinator Conformance
    func start(animated: Bool) {
        let loginVC = authFactory.makeLoginViewController(coordinator: self)
        router.present(loginVC, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
    // MARK: - LoginCoordinatorProtocol Conformance
    func presentRegister() {
        let register = authFactory.makeRegisterViewController(coordinator: self)
        router.present(register, animated: true)
    }
    
}
