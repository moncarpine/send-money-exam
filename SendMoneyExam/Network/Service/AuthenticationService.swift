//
//  AuthenticationService.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/12/25.
//

import Foundation

protocol AuthenticationServiceProtocol {
    func login(username: String, password: String) async throws -> Bool
}

class AuthenticationService: AuthenticationServiceProtocol {
    func login(username: String, password: String) async throws -> Bool {
        do {
            let data = try await APIManager.shared.request(for: .login)
            let user = try JSONDecoder().decode(User.self, from: data)
            
            return username == user.username && password == "123"
        } catch {
            throw error
        }
    }
}

class MockAuthenticationService: AuthenticationServiceProtocol {
    func login(username: String, password: String) async -> Bool {
        try? await Task.sleep(for: .seconds(2))
        return username == "123" && password == "123"
    }
}
