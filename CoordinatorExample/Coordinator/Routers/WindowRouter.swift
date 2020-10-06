//
//  WindowRouter.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

public class WindowRouter: Router {

  // MARK: - Instance Properties
  public let window: Window

  // MARK: - Object Lifecycle
  public init(window: Window) {
    self.window = window
  }

  // MARK: - Router
  public func present(_ viewController: ViewController,
                      animated: Bool,
                      completion: (() -> Void)?) {
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    completion?()
  }

  public func dismiss(animated: Bool, completion: (() -> Void)?) {
    window.rootViewController = nil
    completion?()
  }
  
}
