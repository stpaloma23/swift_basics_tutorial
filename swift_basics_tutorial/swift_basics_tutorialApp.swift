//
//  swift_basics_tutorialApp.swift
//  swift_basics_tutorial
//
//  Created by Paloma St.Clair on 9/29/23.
//

import SwiftUI
import SwiftData

@main
struct swift_basics_tutorialApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
