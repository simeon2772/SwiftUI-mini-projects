//
//  CurrentUserProfileView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    private var posts: [Post] {
        Post.MOCK_POSTS.filter { $0.user?.username == user.username}
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // posts grid view
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // action
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
