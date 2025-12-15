//
//  SendMoneyViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import Foundation

class SendMoneyViewModel: ObservableObject {
    @Published var wallet: Wallet
    
    @Published var showDialogType: DialogType? = nil
    @Published var showDialog = false
    @Published var dialogMessage = ""
    
    private let formatter = AmountFormatter()
    
    init(wallet: Wallet) {
        self.wallet = wallet
    }
    
    func sendMoney(amount: Int) {
        defer {
            print("show dialog")
            showDialog = (showDialogType != nil)
        }
        
        guard isAmountValid(amount) else {
            showDialogType = .alert
            dialogMessage = "Please enter a valid amount to send"
            return
        }
        
        guard isBalanceEnough(for: amount) else {
            showDialogType = .alert
            dialogMessage = "Not enough wallet balance"
            return
        }
        
        guard isAmountLessThanBalance(amount: amount) else {
            showDialogType = .alert
            dialogMessage = "Amount should be less than current wallet balance"
            return
        }
        
        print("send money")
        wallet.deductAmount(amount)
        showDialogType = .success
        dialogMessage = "Money Sent!"
    }
    
    private func isAmountValid(_ amount: Int) -> Bool {
        return amount > 0
    }
    
    private func isBalanceEnough(for amount: Int) -> Bool {
        return amount < wallet.balance
    }
    
    private func isAmountLessThanBalance(amount: Int) -> Bool {
        return amount == wallet.balance
    }
    
    // TODO: create protocol for currencyFormattedBalance()
    func currencyFormattedBalance() -> String {
        return formatter.formattedAmount(wallet.balance)
    }
}
