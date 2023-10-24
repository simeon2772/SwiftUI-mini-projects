//
//  ContentView.swift
//  RandomUsers
//
//  Created by Simeon Ivanov on 23.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var userData = UserData()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userData.users) { user in
                    HStack(spacing: 13) {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                            image.clipShape(Circle())
                        } placeholder: {
                            Image(systemName: "person")
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        Text(user.fullName)
                    }
                }
            }
            .navigationTitle("Random Users")
        }
        
    }
}

#Preview {
    ContentView()
}
