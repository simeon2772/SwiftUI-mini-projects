//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Simeon Ivanov on 23.10.23.
//

import Foundation

struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=15&format=pretty")!
    
    static func getUsers() async throws -> [User] {
        async let (data, _) = URLSession.shared.data(from: url)
        let response = try await JSONDecoder().decode(Responce.self, from: data)
        return response.users
    }
}
