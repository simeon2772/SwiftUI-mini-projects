//
//  NinjaDetailView.swift
//  Naruto
//
//  Created by Simeon Ivanov on 28.09.23.
//

import SwiftUI

struct NinjaDetailView: View {
    
    let ninja: Ninja
    @State private var currentJutsu = ""
    
    var body: some View {
        VStack {
            Image(ninja.firstName)
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 400)
                .clipShape(Capsule())
            Section {
                Text("This is \(ninja.name), age \(ninja.age) from \(ninja.village)")
                    .padding()
            }
            
            Section {
                Text("\(ninja.name) is a part of \(ninja.team) and \(ninja.jutsus)")
                    .padding()
            }
            
            Picker("Select jutsu", selection: $currentJutsu) {
                ForEach(ninja.jutsu, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer()
        }
        .navigationTitle(ninja.name)
    }
}

#Preview {
    NinjaDetailView(ninja: Ninja.exampleNinja)
}
