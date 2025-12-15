//
//  TransactionDataManager.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import CoreData

enum DataError: Error {
    case fetchFailed
    case saveFailed
}

class TransactionDataManager {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchTransactions() throws -> [Transaction] {
        let request: NSFetchRequest<Transaction> = Transaction.fetchRequest()
        let sort = NSSortDescriptor(key: "timestamp", ascending: false)
        
        request.sortDescriptors = [sort]
        
        do {
            return try context.fetch(request)
        } catch {
            throw DataError.fetchFailed
        }
    }
    
    func addTransaction(amount: Int) throws {
        let transaction = Transaction(context: context)
        transaction.amount = Int32(amount)
        transaction.id = UUID()
        transaction.timestamp = .now
        
        try saveContext()
    }
    
    private func saveContext() throws {
        do {
            if context.hasChanges {
                try context.save()
            }
        } catch {
            throw DataError.saveFailed
        }
    }
}
