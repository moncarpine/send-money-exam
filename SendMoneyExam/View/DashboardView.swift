//
//  DashboardView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/11/25.
//

import SwiftUI

struct DashboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var path: NavigationPath
    
    @StateObject var viewModel = WalletViewModel(wallet: .init(balance: 1000))

    var body: some View {
        VStack {
            HStack {
                Text(viewModel.displayBalance())
                    .font(.largeTitle)
                Spacer()
                Button {
                    viewModel.toggleShowBalance()
                } label: {
                    if viewModel.showBalance {
                        Image(systemName: "eye")
                    } else {
                        Image(systemName: "eye.slash")
                    }
                }
                .foregroundColor(.gray)
            }
            .padding()
            .background(Color("LightGray"))
            
            HStack {
                Button {
                    path.append(Route.sendMoney(wallet: viewModel.wallet))
                } label: {
                    Label("Send Money", systemImage: "paperplane.fill")
                        .labelStyle(DashboardLabelStyle())
                }
                .buttonStyle(.bordered)
                
                Button {
                    path.append(Route.transactions)
                } label: {
                    Label("Transactions", systemImage: "list.bullet.rectangle.portrait.fill")
                        .labelStyle(DashboardLabelStyle())
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(.horizontal, 40)
        .navigationTitle("Dashboard")
        .toolbar {
            ToolbarItem {
                Button("Logout") {
                    dismiss()
                }
            }
        }
    }
}

private struct DashboardLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 8) {
            configuration.icon
                .font(.title)
            configuration.title
        }
        .padding()
    }
}
