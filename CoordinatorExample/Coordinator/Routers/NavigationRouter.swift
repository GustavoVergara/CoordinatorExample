//
//  Created by Gustavo Vergara Garcia on 26/08/20.
//

class NavigationRouter: Router {
    var initialViewController: ViewController?
    var hasMadeFirstPresent = false
    
    let navigationController: NavigationController
    
    init(
        navigationController: NavigationController
    ) {
        self.navigationController = navigationController
    }
    
    func present(
        _ viewController: ViewController,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        if self.hasMadeFirstPresent == false {
            self.initialViewController = self.navigationController.topViewController
            self.hasMadeFirstPresent = true
        }
        self.navigationController
            .pushViewController(viewController, animated: animated)
        completion?()
    }
    
    func dismiss(
        animated: Bool,
        completion: (() -> Void)?
    ) {
        if let initialViewController = self.initialViewController {
            self.navigationController
                .popToViewController(initialViewController, animated: animated)
        } else {
            self.navigationController
                .setViewControllers([], animated: animated)
        }
        self.hasMadeFirstPresent = false
        completion?()
    }
}
