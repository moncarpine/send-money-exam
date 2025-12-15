//
//  LoginTests.swift
//  SendMoneyExamTests
//
//  Created by Monty Carlo Pineda on 12/16/25.
//

import XCTest
@testable import SendMoneyExam

final class LoginTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }

    override func tearDown()  {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertEqual(viewModel.username, "")
        XCTAssertEqual(viewModel.password, "")
        XCTAssertEqual(viewModel.errorMessage, "")
        XCTAssertFalse(viewModel.isAuthenticated)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.showErrorMessage)
    }

    func testLoginWithValidCredentials() async {
        viewModel.username = "123"
        viewModel.password = "123"
        
        await viewModel.login()
        
        XCTAssertFalse(viewModel.isLoading, "Loading should be false after completion.")
        XCTAssertTrue(viewModel.isAuthenticated, "Authentication should be true on successful login.")
        XCTAssertEqual(viewModel.errorMessage, "", "Error message should be empty on successful login.")
        XCTAssertFalse(viewModel.showErrorMessage, "Error should not be shown on successful login.")
    }
    
    func testLoginWithInvalidCredentials() async {
        viewModel.username = "111"
        viewModel.password = "111"
        
        await viewModel.login()
        
        XCTAssertFalse(viewModel.isLoading, "Loading should be false after completion.")
        XCTAssertFalse(viewModel.isAuthenticated, "Authentication should be false on failed login.")
        XCTAssertEqual(viewModel.errorMessage, "Incorrect username or password.", "Error message should match invalid credentials.")
        XCTAssertTrue(viewModel.showErrorMessage, "Error should be shown on failed login.")
    }
    
    func testLoginWIthIncompleteCredentials() async {
        viewModel.username = "123"
        viewModel.password = ""
        
        await viewModel.login()

        XCTAssertFalse(viewModel.isLoading, "Loading should be false after completion.")
        XCTAssertFalse(viewModel.isAuthenticated, "Authentication should be false on failed login.")
        XCTAssertEqual(viewModel.errorMessage, "Please enter your username and password.", "Error message should match incomplete credentials.")
        XCTAssertTrue(viewModel.showErrorMessage, "Error should be shown on failed login.")
    }
}
