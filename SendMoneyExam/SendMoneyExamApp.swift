//
//  SendMoneyExamApp.swift
//  SendMoneyExam
//
//  Created by Monty Carlo Pineda on 12/10/25.
//

import SwiftUI

@main
struct SendMoneyExamApp: App {
    let context = PersistenceController.shared.container.viewContext

    @State private var path = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                LoginView(path: $path)
                    .navigationDestination(for: Route.self) { route in
                        route.view($path, context: context)
                            .navigationBarBackButtonHidden(route.hideBackButton)
                    }
                    .environment(\.managedObjectContext, context)
            }
        }
    }
}
