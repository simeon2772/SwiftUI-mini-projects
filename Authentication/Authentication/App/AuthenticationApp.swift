//
//  AuthenticationApp.swift
//  Authentication
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI
import Firebase

@main
struct AuthenticationApp: App {
    @StateObject private var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
