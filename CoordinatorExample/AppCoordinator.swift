//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    let router: Router
    let navigationController: NavigationController
    
    private let userIsLogged = false
    
    init(
        router: Router,
        navigationController: NavigationController = UINavigationController().eraseToNavigationController(),
        authFactory: AuthFactoryProtocol = AuthFactory()
    ) {
        self.router = router
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        router.present(navigationController, animated: animated)
        
        let navigationRouter = NavigationRouter(navigationController: navigationController)
        if !userIsLogged {
            let loginController = AuthCoordinator(router: navigationRouter)
            loginController.start(animated: animated)
        } else {
            // ...
        }
    }
    
    func dismiss(animated: Bool) {
        router.dismiss(animated: animated)
    }
    
}
