//
//  SendMoneyView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/13/25.
//

import SwiftUI

struct SendMoneyView: View {
    @State private var amount = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Enter Amount")
            
            TextField("0.00", text: $amount)
                .font(.largeTitle)
                .textFieldStyle(.roundedBorder)
            
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
            .buttonStyle(.bordered)
            .padding(.top, 8)
        }
        .padding(40)
        .sheet(isPresented: $showAlert) {
            SendMoneyModalView(message: "Money Sent!")
                .presentationDetents([.fraction(0.3)])
        }
    }
}

enum ModalType {
    case success
    case info
    case alert
    case error
}

struct SendMoneyModalView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var message: String
    @State var modalType: ModalType = .error
    
    var body: some View {
        VStack {
            Group {
                switch modalType {
                case .success:
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                case .info:
                    Image(systemName: "info.circle.fill")
                        .foregroundColor(.blue)
                case .alert:
                    Image(systemName: "exclamationmark.circle.fill")
                        .foregroundColor(.yellow)
                case .error:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                }
            }
            .font(.system(size: 64))
            
            Text(message)
                .font(.largeTitle)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
                    .frame(maxWidth: .infinity)
                    .padding(8)
            }
            .buttonStyle(.bordered)
        }
        .padding(24)
    }
}

struct SendMoneyView_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyView()
    }
}

struct SendMoneyModalView_Previews: PreviewProvider {
    static var previews: some View {
        SendMoneyModalView(message: "Money Sent!")
    }
}
