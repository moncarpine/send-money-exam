//
//  View+Placeholder.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/15/25.
//

import SwiftUI

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
