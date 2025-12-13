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

    @State private var path = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
//            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            NavigationStack(path: $path) {
                LoginView(path: $path)
                    .navigationDestination(for: Route.self) { route in
                        route.view($path)
                            .navigationBarBackButtonHidden(route.hideBackButton)
                    }
            }
            
        }
    }
}
