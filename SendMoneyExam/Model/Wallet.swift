//
//  Wallet.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import Foundation

class Wallet: Identifiable, ObservableObject {
    let id = UUID()
    @Published var balance: Int
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func deductAmount(_ deduction: Int) {
        balance -= deduction
    }
}
