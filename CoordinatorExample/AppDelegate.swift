//
//  AppDelegate.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var coordinator = AppCoordinator(
        router: WindowRouter(window: window!.eraseToWindow())
    )
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        coordinator.start(animated: false)
        return true
    }
}

