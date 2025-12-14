//
//  FormatterHelper.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import Foundation

//protocol AmountFormatter {
//    func formattedAmount(_ amount: Int) -> String
//    func maskedAmount() -> String
//}

class AmountFormatter {
    func formattedAmount(_ amount: Int) -> String {
        return "\(Constant.currencySymbol)\(amount.formatted())"
//        return amount.formatted(
//            .currency(code: "PHP")
//            .precision(.fractionLength(0))
//        )
    }
    
    func maskedAmount() -> String {
//        let symbol = Locale(identifier: "USD").currencySymbol ?? ""
        return "\(Constant.currencySymbol)\(Constant.maskedAmount)"
    }
}

class TransactionFormatter: AmountFormatter {
    private let transaction: Transaction
    
    init(_ transaction: Transaction) {
        self.transaction = transaction
    }
    
    func shortDate() -> String {
        return transaction.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    func shortTime() -> String {
        return transaction.date.formatted(date: .omitted, time: .shortened)
    }
    
    func formattedAmount() -> String {
        return formattedAmount(transaction.amount)
    }
}
