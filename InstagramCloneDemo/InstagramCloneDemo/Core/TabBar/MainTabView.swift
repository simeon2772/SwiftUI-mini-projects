//
//  MainTabView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 8.06.24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem { Image(systemName: "house") }
                .tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem { Image(systemName: "plus.square") }
                .tag(2)
            
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem { Image(systemName: "heart") }
                .tag(3)
            
            CurrentUserProfileView(user: User.MOCK_USERS[0])
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem { Image(systemName: "person") }
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
