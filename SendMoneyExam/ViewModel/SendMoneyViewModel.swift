//
//  SendMoneyViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import Foundation

// TODO: refactor implementation of TransactionDatabase in this viewmodel
class SendMoneyViewModel: ObservableObject {
    private let database: TransactionDatabase
    
    @Published var wallet: Wallet
    
    @Published var showDialogType: DialogType? = nil
    @Published var showDialog = false
    @Published var dialogMessage = ""
    
    private let formatter = AmountFormatter()
    
    init(wallet: Wallet) {
        self.wallet = wallet
        self.database = TransactionDatabase(context: PersistenceController.shared.container.viewContext)
    }
    
    func sendMoney(amount: Int) {
        defer {
            showDialog = (showDialogType != nil)
        }
        
        guard isAmountValid(amount) else {
            showDialogType = .alert
            dialogMessage = "Please enter a valid amount to send"
            return
        }
        
        guard !isAmountLessThanBalance(amount: amount) else {
            showDialogType = .alert
            dialogMessage = "Amount should be less than current wallet balance"
            return
        }
        
        guard isBalanceEnough(for: amount) else {
            showDialogType = .alert
            dialogMessage = "Not enough wallet balance"
            return
        }
        
        // TODO: refactor
        wallet.deductAmount(amount)
        database.addTransaction(amount: amount)
        
        showDialogType = .success
        dialogMessage = "Money Sent!"
    }
    
    private func isAmountValid(_ amount: Int) -> Bool {
        return amount > 0
    }
    
    private func isAmountLessThanBalance(amount: Int) -> Bool {
        return amount == wallet.balance
    }
    
    private func isBalanceEnough(for amount: Int) -> Bool {
        return amount < wallet.balance
    }
    
    // TODO: create protocol for currencyFormattedBalance()
    func currencyFormattedBalance() -> String {
        return formatter.formattedAmount(wallet.balance)
    }
}
