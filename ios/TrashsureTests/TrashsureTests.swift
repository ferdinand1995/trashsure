//
//  TrashsureTests.swift
//  TrashsureTests
//
//  Created by Ferdinand on 08/01/22.
//

import XCTest
@testable import Trashsure

class TrashsureTests: XCTestCase {
    
    let service = "token"
    let account = "domain.com"
    var auth: Auth?

    override func setUpWithError() throws {
        auth = Auth(accessToken: "dummy-access-token", refreshToken: "dummy-refresh-token")
    }

    override func tearDownWithError() throws {
        auth = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        KeychainHelper().save(auth, service: service, account: account)
        guard let result = KeychainHelper().read(service: service, account: account, type: Auth.self) else { return }
        XCTAssertEqual("dummy-access-token", result.accessToken)

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

}
