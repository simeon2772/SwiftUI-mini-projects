//
//  User.swift
//  friendface sample
//
//  Created by Simeon Ivanov on 7.09.23.
//

import Foundation


struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let friends: [Friend]
}
