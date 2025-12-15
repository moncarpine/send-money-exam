//
//  TransactionViewModel.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import CoreData

class TransactionDatabase {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchTransactions() -> [Transaction] {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        let sort = NSSortDescriptor(key: "timestamp", ascending: false)
        
        request.sortDescriptors = [sort]
        
        do {
            return try context.fetch(request)
        } catch {
            print("failed to fetch transactions \(error.localizedDescription)")
        }
        
        return []
    }
    
    func addTransaction(amount: Int) {
        let transaction = Transaction(context: context)
        transaction.amount = Int32(amount)
        transaction.id = UUID()
        transaction.timestamp = .now
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save Tags: \(error.localizedDescription)")
        }
    }
}

class TransactionViewModel: ObservableObject {
    private let database: TransactionDatabase // TODO: create abstraction
    
    @Published var transactions = [Transaction]()
    
    init(context: NSManagedObjectContext) {
        self.database = TransactionDatabase(context: context)
        
        fetchTransactions()
    }
    
    func fetchTransactions() {
        transactions = database.fetchTransactions()
    }
    
    func addTransaction(amount: Int) {
        database.addTransaction(amount: amount)
    }
}
