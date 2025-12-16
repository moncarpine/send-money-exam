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
    @Published var errorMessage = ""
    @Published var isAuthenticated = false
    @Published var isLoading = false
    
    var showErrorMessage: Bool {
        return errorMessage.isEmpty ? false : true
    }
    
    private let service: AuthenticationServiceProtocol
    
    init(service: AuthenticationServiceProtocol = AuthenticationService()) {
        self.service = service
    }
    
    @MainActor
    func login() async {
        errorMessage = ""
        
        guard !username.isEmpty && !password.isEmpty else {
            errorMessage = "Please enter your username and password."
            return
        }
        
        isLoading = true
        
        do {
            isAuthenticated = try await service.login(username: username, password: password)
        } catch {
            errorMessage = error.localizedDescription
        }
        
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
        errorMessage = ""
    }
}
