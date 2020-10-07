//
//  AuthFactorySpy.swift
//  CoordinatorExampleTests
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

@testable import CoordinatorExample

class AuthFactorySpy: AuthFactoryProtocol {
    var invokedMakeAuthCoordinator = false
    var invokedMakeAuthCoordinatorCount = 0
    var invokedMakeAuthCoordinatorParameters: (router: Router, Void)?
    var invokedMakeAuthCoordinatorParametersList = [(router: Router, Void)]()
    var stubbedMakeAuthCoordinatorResult: AuthCoordinator!

    func makeAuthCoordinator(router: Router) -> AuthCoordinator {
        invokedMakeAuthCoordinator = true
        invokedMakeAuthCoordinatorCount += 1
        invokedMakeAuthCoordinatorParameters = (router, ())
        invokedMakeAuthCoordinatorParametersList.append((router, ()))
        return stubbedMakeAuthCoordinatorResult
    }

    var invokedMakeLoginViewController = false
    var invokedMakeLoginViewControllerCount = 0
    var invokedMakeLoginViewControllerParameters: (coordinator: AuthCoordinatorProtocol, Void)?
    var invokedMakeLoginViewControllerParametersList = [(coordinator: AuthCoordinatorProtocol, Void)]()
    var stubbedMakeLoginViewControllerResult: ViewController!

    func makeLoginViewController(coordinator: AuthCoordinatorProtocol) -> ViewController {
        invokedMakeLoginViewController = true
        invokedMakeLoginViewControllerCount += 1
        invokedMakeLoginViewControllerParameters = (coordinator, ())
        invokedMakeLoginViewControllerParametersList.append((coordinator, ()))
        return stubbedMakeLoginViewControllerResult
    }

    var invokedMakeRegisterViewController = false
    var invokedMakeRegisterViewControllerCount = 0
    var invokedMakeRegisterViewControllerParameters: (coordinator: AuthCoordinatorProtocol, Void)?
    var invokedMakeRegisterViewControllerParametersList = [(coordinator: AuthCoordinatorProtocol, Void)]()
    var stubbedMakeRegisterViewControllerResult: ViewController!

    func makeRegisterViewController(coordinator: AuthCoordinatorProtocol) -> ViewController {
        invokedMakeRegisterViewController = true
        invokedMakeRegisterViewControllerCount += 1
        invokedMakeRegisterViewControllerParameters = (coordinator, ())
        invokedMakeRegisterViewControllerParametersList.append((coordinator, ()))
        return stubbedMakeRegisterViewControllerResult
    }
}
