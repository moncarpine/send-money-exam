//
//  TransactionItemView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import SwiftUI

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

struct TransactionItemView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionItemView(transaction: .init())
    }
}
