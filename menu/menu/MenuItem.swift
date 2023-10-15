//
//  MenuItems.swift
//  menu
//
//  Created by Simeon Ivanov on 20.06.23.
//

import Foundation

struct MenuItem: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var price: String
    var imageName: String
    
}

