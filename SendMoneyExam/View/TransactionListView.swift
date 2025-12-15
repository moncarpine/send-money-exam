//
//  TransactionListView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import SwiftUI

struct TransactionListView: View {
    @StateObject var viewModel: TransactionViewModel

    var body: some View {
        List(viewModel.transactions) {
            TransactionItemView(transaction: $0)
        }
        .emptyPlaceholder(viewModel.transactions,
                          placeholder: EmptyTransactionView())
    }
}

private struct EmptyTransactionView: View {
    var body: some View {
        VStack {
            Image(systemName: "info.circle.fill")
                .foregroundColor(.blue)
                .font(.system(size: 64))
            Text("No Transactions")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
    }
}
