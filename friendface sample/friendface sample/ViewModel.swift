//
//  ViewModel.swift
//  friendface sample
//
//  Created by Simeon Ivanov on 7.09.23.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func getData() {
        guard users.isEmpty else {return}
        
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error while getting data: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.users = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
