//
//  DashboardView.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/11/25.
//

import SwiftUI

struct DashboardView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showBalance = true
    
    var body: some View {
        VStack {
            HStack {
                Text(showBalance ? "$ 1,000" : "$ *****")
                    .font(.largeTitle)
                Spacer()
                Button {
                    toggleBalanceVisibility()
                } label: {
                    if showBalance {
                        Image(systemName: "eye")
                    } else {
                        Image(systemName: "eye.slash")
                    }
                }
                .foregroundColor(.gray)
            }
            .padding()
            .background(Color("LightGray"))
            
            HStack {
                Button {
                    
                } label: {
                    Label("Send Money", systemImage: "paperplane.fill")
                        .labelStyle(DashboardLabelStyle())
                }
                .buttonStyle(.bordered)
                
                Button {
                    
                } label: {
                    Label("Transactions", systemImage: "list.bullet.rectangle.portrait.fill")
                        .labelStyle(DashboardLabelStyle())
                }
                .buttonStyle(.bordered)
            }
        }
        .padding(.horizontal, 40)
        .navigationTitle("Dashboard")
        .toolbar {
            ToolbarItem {
                Button("Logout") {
                    dismiss()
                }
            }
        }
    }
    
    func toggleBalanceVisibility() {
        showBalance.toggle()
    }
}

private struct DashboardLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 8) {
            configuration.icon
                .font(.title)
            configuration.title
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
