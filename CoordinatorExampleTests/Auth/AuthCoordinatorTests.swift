//
//  AuthCoordinatorTests.swift
//  CoordinatorExampleTests
//
//  Created by Gustavo Vergara Garcia on 06/10/20.
//  Copyright © 2020 Gustavo Vergara. All rights reserved.
//

import XCTest
@testable import CoordinatorExample

class AuthCoordinatorTests: XCTestCase {
    var routerSpy: RouterSpy!
    var authFactorySpy: AuthFactorySpy!
    
    var sut: AuthCoordinatorProtocol!

    override func setUp() {
        routerSpy = RouterSpy()
        authFactorySpy = AuthFactorySpy()
        
        sut = AuthCoordinator(
            router: routerSpy,
            authFactory: authFactorySpy
        )
    }
    
    func test_start_presentsLogin() {
        let expectedViewController = ViewControllerSpy()
        authFactorySpy.stubbedMakeLoginViewControllerResult = expectedViewController
        
        sut.start(animated: true)
        
        let receivedViewController = routerSpy.invokedPresentParameters?.viewController as? ViewControllerSpy
        
        XCTAssertEqual(
            receivedViewController,
            expectedViewController
        )
    }
}
