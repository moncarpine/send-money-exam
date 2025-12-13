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
    case sendMoney
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
        case .sendMoney:
            SendMoneyView()
        case .transactions:
            EmptyView()
        }
    }
}
