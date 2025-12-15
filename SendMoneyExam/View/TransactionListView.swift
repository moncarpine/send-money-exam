//
//  TransactionListView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import SwiftUI

struct TransactionListView: View {
    @StateObject var viewModel: TransactionViewModel
    
//    let transactions = Array(repeating: Transaction(date: .now, amount: 1000),
//                             count: 5)
    
    @FetchRequest(
        entity: Transaction.entity(),
        sortDescriptors: [NSSortDescriptor(key: "timestamp",
                                           ascending: false)]
    )
    private var transactions: FetchedResults<Transaction>
    
    var body: some View {
        List(transactions) {
            TransactionItemView(transaction: $0)
        }
        .emptyPlaceholder(transactions, placeholder:
            VStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 64))
                Text("No Transactions")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
            }
        )
    }
}

extension View {
    @ViewBuilder
    func emptyPlaceholder<Items: Collection, PlaceholderView: View>(_ items: Items, placeholder: PlaceholderView) -> some View {
        if items.isEmpty {
            placeholder
        } else {
            self
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionViewModel())
    }
}
