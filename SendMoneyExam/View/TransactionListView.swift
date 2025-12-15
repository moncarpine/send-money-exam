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
        .emptyPlaceholder(viewModel.transactions, placeholder:
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
        TransactionListView(viewModel: TransactionViewModel(context: PersistenceController.shared.container.viewContext))
    }
}
