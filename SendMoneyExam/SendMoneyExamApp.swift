//
//  SendMoneyExamApp.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/10/25.
//

import SwiftUI

@main
struct SendMoneyExamApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            LoginView()
        }
    }
}
