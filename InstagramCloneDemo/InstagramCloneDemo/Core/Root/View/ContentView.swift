//
//  ContentView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 8.06.24.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
