//
//  LoginViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/11/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service: AuthenticationServiceProtocol
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    @MainActor
    func login() async {
        guard !username.isEmpty && !password.isEmpty else {
            errorMessage = "Please enter your username and password."
            return
        }
        
        isLoading = true
        isAuthenticated = await service.login(username: username, password: password)
        isLoading = false
        
        if isAuthenticated {
            resetFields()
        } else {
            errorMessage = "Incorrect username or password."
        }
    }
    
    func resetFields() {
        username = ""
        password = ""
        errorMessage = nil
    }
}
