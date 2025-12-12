//
//  LoginView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/11/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack() {
            VStack(spacing: 8) {
                Group {
                    TextField("Username", text: $viewModel.username)
                    TextField("Password", text: $viewModel.password)
                }
                .disabled(viewModel.isLoading)
                .padding(.horizontal)
                .textFieldStyle(.roundedBorder)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Button("Login") {
                        Task { await viewModel.login() }
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                DashboardView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
