//
//  PostGridView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 10.06.24.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    private let columns: [GridItem] = [
        .init(.flexible(), spacing: 1.5),
        .init(.flexible(), spacing: 1.5),
        .init(.flexible(), spacing: 1.5),
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1.5) {
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                    .clipped()
            }
            
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
