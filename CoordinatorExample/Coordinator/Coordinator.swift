//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

public protocol Coordinator {
    func start(animated: Bool)
    func dismiss(animated: Bool)
}
