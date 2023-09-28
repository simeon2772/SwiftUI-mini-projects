//
//  ContentView.swift
//  Naruto
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var viewModel = NinjaDataModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.ninjas) { ninja in
                    NavigationLink(destination: NinjaDetailView(ninja: ninja)) {
                        HStack {
                            Image("team7")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 50)
                                .clipShape(Circle())
                            
                            Text(ninja.name)
                                .font(.title2)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Hidden Leaf Ninjas")
        }
    }
}

#Preview {
    ContentView()
}
