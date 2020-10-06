//
//  Created by Gustavo Vergara Garcia on 17/08/20.
//

import UIKit

// MARK: - Protocol
public protocol NavigationController: ViewController {
    func asNavigationController() -> UINavigationController
    
    func pushViewController(_ viewController: ViewController, animated: Bool)
    
    @discardableResult
    func popViewController(animated: Bool) -> ViewController?
    @discardableResult
    func popToViewController(_ viewController: ViewController, animated: Bool) -> [ViewController]?
    @discardableResult
    func popToRootViewController(animated: Bool) -> [ViewController]?
    
    var topViewController: ViewController? { get }
    var visibleViewController: ViewController? { get }
    
    var viewControllers: [ViewController] { get set }
    
    func setViewControllers(_ viewControllers: [ViewController], animated: Bool)
}

// MARK: - Implementation
public class NavigationControllerAdapter: NavigationController {
    let navigationController: UINavigationController

    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: Presentable

    public func asViewController() -> UIViewController { self.navigationController }

    public func present(_ viewController: ViewController, animated: Bool, completion: (() -> Void)?) {
        self.navigationController.present(viewController.asViewController(), animated: animated, completion: completion)
    }

    public func dismiss(animated: Bool, completion: (() -> Void)?) {
        self.navigationController.dismiss(animated: animated, completion: completion)
    }
    
    // MARK: Navigation Presentable
    
    public func asNavigationController() -> UINavigationController { self.navigationController }
    
    public func pushViewController(_ viewController: ViewController, animated: Bool) {
        self.navigationController
            .pushViewController(viewController.asViewController(), animated: animated)
    }
    
    @discardableResult
    public func popViewController(animated: Bool) -> ViewController? {
        self.navigationController
            .popViewController(animated: animated)?
            .eraseToViewController()
    }
    
    @discardableResult
    public func popToViewController(_ viewController: ViewController, animated: Bool) -> [ViewController]? {
        self.navigationController
            .popToViewController(viewController.asViewController(), animated: animated)?
            .map { $0.eraseToViewController() }
    }
    
    @discardableResult
    public func popToRootViewController(animated: Bool) -> [ViewController]? {
        self.navigationController
            .popToRootViewController(animated: animated)?
            .map { $0.eraseToViewController() }
    }
    
    public var topViewController: ViewController? {
        self.navigationController.topViewController?
            .eraseToViewController()
    }
    public var visibleViewController: ViewController? {
        self.navigationController.visibleViewController?
            .eraseToViewController()
    }
    
    public var viewControllers: [ViewController] {
        get { self.navigationController.viewControllers.map { $0.eraseToViewController() } }
        set { self.navigationController.viewControllers = newValue.map { $0.asViewController() } }
    }
    
    public func setViewControllers(_ viewControllers: [ViewController], animated: Bool) {
        self.navigationController
            .setViewControllers(viewControllers.map { $0.asViewController() },
                                animated: animated)
    }
}

// MARK: - Extensions
public extension UINavigationController {
    func eraseToNavigationController() -> NavigationController { NavigationControllerAdapter(self) }
}
