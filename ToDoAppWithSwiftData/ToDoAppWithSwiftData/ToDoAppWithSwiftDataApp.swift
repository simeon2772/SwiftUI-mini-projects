//
//  ToDoAppWithSwiftDataApp.swift
//  ToDoAppWithSwiftData
//
//  Created by Simeon Ivanov on 29.09.23.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppWithSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [ToDo.self])
        }
    }
}
