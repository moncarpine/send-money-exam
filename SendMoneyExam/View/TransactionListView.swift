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
    
    var body: some View {
        List(viewModel.transactions) {
            TransactionItemView(transaction: $0)
        }
    }
}

struct TransactionItemView: View {
    private let formatter: TransactionFormatter
    
    init(transaction: Transaction) {
        self.formatter = TransactionFormatter(transaction)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(formatter.shortDate())
                Text(formatter.shortTime())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            Text(formatter.formattedAmount())
                .font(.largeTitle)
        }
        .navigationTitle("Transactions")
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: TransactionViewModel())
    }
}

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(transaction: Transaction(date: .now, amount: 1000))
    }
}
