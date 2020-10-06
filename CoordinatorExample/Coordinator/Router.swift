//
//  Router.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

public protocol Router: class {
    func present(_ viewController: ViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension Router {
    func present(_ viewController: ViewController, animated: Bool) {
        self.present(viewController, animated: animated, completion: nil)
    }
    func dismiss(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }
}
