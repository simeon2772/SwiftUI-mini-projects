//
//  Little_Lemon_IOS_appApp.swift
//  Little Lemon IOS app
//
//  Created by Simeon Ivanov on 24.08.23.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
