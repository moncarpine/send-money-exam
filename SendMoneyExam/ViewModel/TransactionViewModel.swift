//
//  TransactionViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let date: Date
    let amount: Int
}

class TransactionViewModel: ObservableObject {
    @Published var transactions: [Transaction] = Array(repeating: Transaction(date: .now, amount: 1000),
                                                       count: 5)
}
