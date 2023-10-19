//
//  DetailsView.swift
//  friendface sample
//
//  Created by Simeon Ivanov on 7.09.23.
//

import SwiftUI

struct DetailsView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(user.name)")
                .font(.headline)
            Text("Age: \(user.age)")
                .font(.headline)
            Text("Company: \(user.company)")
                .font(.headline)
            Text("Email: \(user.email)")
                .font(.headline)
           
            List(user.friends) { friend in
                Text(friend.name)
            }
        }
        .padding()
        .navigationTitle(user.name)
    }
}

