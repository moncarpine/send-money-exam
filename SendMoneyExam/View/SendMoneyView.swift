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
    @State private var showAlert = false
    
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
                showAlert.toggle()
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
        .sheet(isPresented: $showAlert, onDismiss: clearFields) {
            DialogView(message: "Money Sent!")
                .presentationDetents([.fraction(0.3)])
        }
    }
    
    private func clearFields() {
        amountToSend = nil
        isAmountFocused = true
    }
}

struct SendMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyView(viewModel: .init(wallet: .init(balance: 1000)))
    }
}
