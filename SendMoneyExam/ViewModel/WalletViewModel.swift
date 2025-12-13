//
//  WalletViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import Foundation

class WalletViewModel: ObservableObject {
    let currencySymbol = "₱"
    
    @Published var balance = 1000
    @Published var showBalance = true
    
    private var hiddenBalance: String {
        return String(balance).map({ _ in "*"}).joined()
    }
    
    func displayBalance() -> String {
        return "\(currencySymbol) \(formattedBalance())"
    }
    
    func toggleShowBalance() {
        showBalance.toggle()
    }
    
    func formattedBalance() -> String {
        return showBalance ? "\(balance.formatted(.number))" : hiddenBalance
    }
}

class WalletFormatter {
    
}
