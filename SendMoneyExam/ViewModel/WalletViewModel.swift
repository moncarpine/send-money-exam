//
//  WalletViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import Foundation

class WalletViewModel: ObservableObject {
    @Published var wallet: Wallet
    @Published var showBalance = true
    
    private let formatter = AmountFormatter()
    
    init(wallet: Wallet) {
        self.wallet = wallet
    }
    
    // TODO: create protocol for currencyFormattedBalance()
    // for displaying current balance formatted with currency symbol.
    func currencyFormattedBalance() -> String {
        return formatter.formattedAmount(wallet.balance)
    }

    // for displaying current balance either currency formatted or masked.
    func displayBalance() -> String {
        return showBalance ? currencyFormattedBalance() : formatter.maskedAmount()
    }
    
    func toggleShowBalance() {
        showBalance.toggle()
    }
}
