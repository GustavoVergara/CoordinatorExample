//
//  ViewControllerSpy.swift
//  CoordinatorExampleTests
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import UIKit
@testable import CoordinatorExample

class ViewControllerSpy: ViewController {
    let id = UUID()
    
    var invokedAsViewController = false
    var invokedAsViewControllerCount = 0
    var stubbedAsViewControllerResult: UIViewController!

    func asViewController() -> UIViewController {
        invokedAsViewController = true
        invokedAsViewControllerCount += 1
        return stubbedAsViewControllerResult
    }

    var invokedPresent = false
    var invokedPresentCount = 0
    var invokedPresentParameters: (viewController: ViewController, animated: Bool)?
    var invokedPresentParametersList = [(viewController: ViewController, animated: Bool)]()
    var shouldInvokePresentCompletion = false

    func present(_ viewController: ViewController, animated: Bool, completion: (() -> Void)?) {
        invokedPresent = true
        invokedPresentCount += 1
        invokedPresentParameters = (viewController, animated)
        invokedPresentParametersList.append((viewController, animated))
        if shouldInvokePresentCompletion {
            completion?()
        }
    }

    var invokedDismiss = false
    var invokedDismissCount = 0
    var invokedDismissParameters: (animated: Bool, Void)?
    var invokedDismissParametersList = [(animated: Bool, Void)]()
    var shouldInvokeDismissCompletion = false

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        invokedDismiss = true
        invokedDismissCount += 1
        invokedDismissParameters = (animated, ())
        invokedDismissParametersList.append((animated, ()))
        if shouldInvokeDismissCompletion {
            completion?()
        }
    }
}

extension ViewControllerSpy: Equatable {
    
    static func == (lhs: ViewControllerSpy, rhs: ViewControllerSpy) -> Bool {
        lhs.id == rhs.id
    }
    
}
