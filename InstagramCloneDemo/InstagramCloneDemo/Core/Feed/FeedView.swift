//
//  FeedView.swift
//  InstagramCloneDemo
//
//  Created by Simeon Ivanov on 8.06.24.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 40) {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 6)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Image(.logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 95)
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
