//
//  SendMoneyView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import SwiftUI

struct SendMoneyView: View {
    @State private var amount: Int?
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Enter Amount")
            
            TextField("0", value: $amount, format: .number)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            Text("Current balance: 1,000")
                .font(.caption)
                .foregroundColor(.blue)
            
            Button {
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
        .sheet(isPresented: $showAlert) {
            DialogView(message: "Money Sent!")
                .presentationDetents([.fraction(0.3)])
        }
    }
}

struct SendMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyView()
    }
}
