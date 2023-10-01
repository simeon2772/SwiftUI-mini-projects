//
//  DataModel.swift
//  ToDoAppWithSwiftData
//
//  Created by Simeon Ivanov on 29.09.23.
//

import Foundation
import SwiftData

@Model class ToDo {
    var item: String
    var isDone: Bool
    
    init(item: String, isDone: Bool) {
        self.item = item
        self.isDone = isDone
    }
}
