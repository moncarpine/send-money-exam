//
//  AuthenticationService.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/12/25.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func login(username: String, password: String) async -> Bool
}

class AuthenticationService: AuthenticationServiceProtocol {
    func login(username: String, password: String) async -> Bool {
        try? await Task.sleep(for: .seconds(2))
        return username == "123" && password == "123"
    }
}
