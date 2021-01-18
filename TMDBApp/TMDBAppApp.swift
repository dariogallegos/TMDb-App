//
//  TMDBAppApp.swift
//  TMDBApp
//
//  Created by Dario Gallegos on 16/1/21.
//

import SwiftUI

@main
struct TMDBAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
