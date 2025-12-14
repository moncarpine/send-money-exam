//
//  DialogView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/14/25.
//

import SwiftUI

struct DialogView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var message: String
    @State var modalType: DialogType = .success
    
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

struct SendMoneyDialogView_Previews: PreviewProvider {
    static var previews: some View {
        DialogView(message: "Money Sent!")
    }
}
