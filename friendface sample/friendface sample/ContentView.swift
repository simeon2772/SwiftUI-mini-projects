//
//  ContentView.swift
//  friendface sample
//
//  Created by Simeon Ivanov on 7.09.23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                NavigationLink(destination: DetailsView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.isActive ? "Active":"Inactive")
                            .font(.subheadline)
                            .foregroundColor(user.isActive ? .green : .red)
                            
                    }
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.getData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
