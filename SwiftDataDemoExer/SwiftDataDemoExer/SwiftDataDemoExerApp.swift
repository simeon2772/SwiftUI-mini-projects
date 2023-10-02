//
//  SwiftDataDemoExerApp.swift
//  SwiftDataDemoExer
//
//  Created by Simeon Ivanov on 1.10.23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoExerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
    }
}
