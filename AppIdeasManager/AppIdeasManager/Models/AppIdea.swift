//
//  AppIdea.swift
//  AppIdeasManager
//
//  Created by Simeon Ivanov on 2.10.23.
//

import Foundation
import SwiftData

@Model
class AppIdea {
    @Attribute(.unique) var name: String
    var detailedDescription: String
    var creationDate: Date
    
    init(name: String, detailedDescription: String) {
        self.name = name
        self.detailedDescription = detailedDescription
        self.creationDate = .now
    }
    
    @Relationship(deleteRule: .cascade) var features: [AppFeature] = []
}
