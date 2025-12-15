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
            ZStack(alignment: .bottomLeading) {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 64))
                Image(systemName: "pesosign.square.fill")
                    .font(.system(size: 28))
            }
            .foregroundColor(.blue)
            
            Text("Send Money")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .padding(.bottom, 24)
            
            Group {
                TextField("Username", text: $viewModel.username)
                SecureField("Password", text: $viewModel.password)
            }
            .disabled(viewModel.isLoading)
            .textFieldStyle(.roundedBorder)
            
            Text(viewModel.errorMessage)
                .font(.footnote)
                .foregroundColor(.red)
                .opacity(viewModel.showErrorMessage ? 1 : 0)
            
            Button {
                Task {
                    await viewModel.login()
                    
                    if viewModel.isAuthenticated {
                        path.append(Route.dashboard)
                    }
                }
            } label: {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("Login")
                            .bold()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.isLoading)
        }
        .padding(.horizontal, 32)
    }
}
