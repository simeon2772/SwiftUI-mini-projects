//
//  AppFeature.swift
//  AppIdeasManager
//
//  Created by Simeon Ivanov on 2.10.23.
//

import Foundation
import SwiftData

@Model
class AppFeature {
    @Attribute(.unique) var detailedDescription: String
    var creationDate: Date
    
    init(detailedDescription: String) {
        self.detailedDescription = detailedDescription
        self.creationDate = .now
    }
}
