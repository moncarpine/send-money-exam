//
//  LoginView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/11/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 8) {
            Group {
                TextField("Username", text: $viewModel.username)
                TextField("Password", text: $viewModel.password)
            }
            .disabled(viewModel.isLoading)
            .padding(.horizontal)
            .textFieldStyle(.roundedBorder)
            
            Text(viewModel.errorMessage)
                .font(.footnote)
                .foregroundColor(.red)
                .opacity(viewModel.showErrorMessage ? 1 : 0)
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    Task {
                        await viewModel.login()
                        
                        if viewModel.isAuthenticated {
                            path.append(Route.dashboard)
                        }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(path: .constant(.init()))
    }
}
