//
//  WindowProtocol.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import UIKit

// MARK: - Protocol
public protocol Window: class {
  var rootViewController: ViewController? { get set }
  
  func makeKeyAndVisible()
}

// MARK: - Implementation
class WindowAdapter: Window {
    
    let window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    var rootViewController: ViewController? {
        get {
            window.rootViewController?.eraseToViewController()
        }
        set {
            window.rootViewController = newValue?.asViewController()
        }
    }
    
    func makeKeyAndVisible() {
        window.makeKeyAndVisible()
    }
}

extension UIWindow {
    func eraseToWindow() -> Window { WindowAdapter(self) }
}
