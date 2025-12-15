//
//  Route.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import SwiftUI

enum Route {
    case login
    case dashboard
    case sendMoney(wallet: Wallet)
    case transactions
    
    var hideBackButton: Bool {
        switch self {
        case .dashboard:
            return true
        default:
            return false
        }
    }
    
    @ViewBuilder
    func view(_ path: Binding<NavigationPath>) -> some View {
        switch self {
        case .login:
            LoginView(path: path)
        case .dashboard:
            DashboardView(path: path)
        case .sendMoney(let wallet):
            SendMoneyView(viewModel: SendMoneyViewModel(wallet: wallet))
        case .transactions:
            TransactionListView(viewModel: TransactionViewModel())
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
        }
    }
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case let .sendMoney(wallet):
            hasher.combine(wallet.id)
        default:
            break
        }
    }
}
