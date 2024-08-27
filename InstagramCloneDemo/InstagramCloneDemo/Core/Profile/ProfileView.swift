//
//  ProfileView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 8.06.24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private var posts: [Post] {
        Post.MOCK_POSTS.filter { $0.user?.username == user.username}
    }
        
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            
            // posts grid view
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[4])
}
