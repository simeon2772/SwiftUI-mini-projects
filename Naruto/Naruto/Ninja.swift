//
//  Ninja.swift
//  Naruto
//
//  Created by Simeon Ivanov on 28.09.23.
//

import Foundation

struct Ninja: Codable, Identifiable {
    let id = UUID()
    let name: String
    let age: Int
    let village: String
    let team: String
    let jutsu: [String]
    
    var jutsus: String {
        return "is capable of \(jutsu[0]), \(jutsu[1]) and \(jutsu[2])"
    }
    
    static let exampleNinja = Ninja(name: "Simeon", age: 21, village: "Sofia", team: "team 7 ", jutsu: ["Rinnegan", "Rasengan", "Chidori"])
    
    var firstName: String {
        return String(name.split(separator: " ")[0])
    }
}
