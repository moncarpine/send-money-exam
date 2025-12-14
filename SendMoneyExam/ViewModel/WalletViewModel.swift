//
//  WalletViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import Foundation

class WalletViewModel: ObservableObject {
    @Published var balance = 1000
    @Published var showBalance = true
    
    private let formatter = AmountFormatter()
    
//    private var hiddenBalance: String {
//        return formatter.maskedAmount()
//    }
//
//    func formattedBalance() -> String {
//        return showBalance ? "\(balance.formatted(.number))" : hiddenBalance
//    }
    
    func displayBalance() -> String {
        return showBalance ? formatter.formattedAmount(balance) : formatter.maskedAmount()
    }
    
    func toggleShowBalance() {
        showBalance.toggle()
    }
}

class WalletFormatter {
    
}
