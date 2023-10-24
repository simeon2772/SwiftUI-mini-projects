//
//  UserData.swift
//  RandomUsers
//
//  Created by Simeon Ivanov on 23.10.23.
//

import Foundation
import Observation

@Observable
class UserData {
    var users: [User] = []
    
    init() {
        Task {
            do {
                let users = try await UserFetchingClient.getUsers()
                self.users = users
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
