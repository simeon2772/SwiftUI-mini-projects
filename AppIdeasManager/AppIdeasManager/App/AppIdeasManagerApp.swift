//
//  AppIdeasManagerApp.swift
//  AppIdeasManager
//
//  Created by Simeon Ivanov on 2.10.23.
//

import SwiftUI

@main
struct AppIdeasManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [AppIdea.self, AppFeature.self])
    }
}
