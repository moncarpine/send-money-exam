//
//  SendMoneyViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import Foundation

class SendMoneyViewModel: ObservableObject {
    @Published var wallet: Wallet
    
    private let formatter = AmountFormatter()
    
    init(wallet: Wallet) {
        self.wallet = wallet
    }
    
    func sendMoney(amount: Int) {
        wallet.deductAmount(amount)
    }
    
    // TODO: create protocol for currencyFormattedBalance()
    func currencyFormattedBalance() -> String {
        return formatter.formattedAmount(wallet.balance)
    }
}
