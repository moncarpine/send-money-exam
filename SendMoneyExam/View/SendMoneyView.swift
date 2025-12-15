//
//  SendMoneyView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import SwiftUI

struct SendMoneyView: View {
    @StateObject var viewModel: SendMoneyViewModel
    
    @State private var amountToSend: Int?
    
    @FocusState private var isAmountFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Enter Amount")
            
            TextField("0", value: $amountToSend, format: .number)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .focused($isAmountFocused)
            
            Text("Current balance: \(viewModel.currencyFormattedBalance())")
                .font(.caption)
                .foregroundColor(.blue)
            
            Button {
                isAmountFocused = false
                viewModel.sendMoney(amount: amountToSend ?? 0)
            } label: {
                Text("Send")
                    .frame(maxWidth: .infinity)
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .bold()
            .padding(.top, 8)
        }
        .padding(40)
        .sheet(isPresented: $viewModel.showDialog, onDismiss: clearFields) {
            DialogView(message: viewModel.dialogMessage,
                       dialogType: viewModel.showDialogType ?? .info)
                .presentationDetents([.medium])
        }
    }
    
    private func clearFields() {
        amountToSend = nil // TODO: clear only if money sent successfully.
        isAmountFocused = true
    }
}

struct SendMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyView(viewModel: .init(wallet: .init(balance: 1000),
                                       context: PersistenceController.shared.container.viewContext))
    }
}
