//
//  TransactionViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import CoreData

class TransactionViewModel: ObservableObject {
    private let database: TransactionDataManager // TODO: create abstraction
    
    @Published var transactions = [Transaction]()
    
    init(context: NSManagedObjectContext) {
        self.database = TransactionDataManager(context: context)
        
        try? fetchTransactions()
    }
    
    func fetchTransactions() throws {
        try transactions = database.fetchTransactions()
    }
    
    func addTransaction(amount: Int) throws {
        try database.addTransaction(amount: amount)
    }
}
