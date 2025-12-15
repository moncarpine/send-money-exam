//
//  Route.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import SwiftUI
import CoreData

enum Route {
    case login
    case dashboard
    case sendMoney(wallet: Wallet)
    case transactions
}

extension Route {
    var hideBackButton: Bool {
        switch self {
        case .dashboard:
            return true
        default:
            return false
        }
    }
    
    @ViewBuilder
    func view(_ path: Binding<NavigationPath>, context: NSManagedObjectContext) -> some View {
        switch self {
        case .login:
            LoginView(path: path)
        case .dashboard:
            DashboardView(path: path)
        case .sendMoney(let wallet):
            SendMoneyView(viewModel: SendMoneyViewModel(wallet: wallet, context: context))
        case .transactions:
            TransactionListView(viewModel: TransactionViewModel(context: context))
                .environment(\.managedObjectContext, context)
        }
    }
}

extension Route: Hashable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.login, .login):
            return true
        case (.dashboard, .dashboard):
            return true
        case let (.sendMoney(lhsWallet), .sendMoney(rhsWallet)):
            return lhsWallet.id == rhsWallet.id
        case (.transactions, .transactions):
            return true
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .login:
            hasher.combine("login")
        case .dashboard:
            hasher.combine("dashboard")
        case let .sendMoney(wallet):
            hasher.combine("sendMoney")
            hasher.combine(wallet.id)
        case .transactions:
            hasher.combine("transactions")
        }
    }
}
