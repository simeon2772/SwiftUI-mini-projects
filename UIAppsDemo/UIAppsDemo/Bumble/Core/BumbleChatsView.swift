//
//  BumbleChatsView.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 6.08.24.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatsView: View {
    @Environment(\.router) var router
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
                matchQueueSection
                    .padding(.top, 24)
                
                chatsSections
                
            }
        }
        .task {
            await loadData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func loadData() async {
        guard allUsers.isEmpty else { return }
        
        do {
            self.allUsers = try await DatabaseHelper().getUsers()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    private var matchQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Match Queue ")
                    .font(.title3)
                    .fontWeight(.semibold)
                +
                Text("(\(allUsers.count))")
                    .foregroundStyle(.bumbleGray)
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleProfileImageCell(
                            imageName: user.images.randomElement()!,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(height: 100)
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chatsSections: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Group {
                    Text("Chats ")
                        .font(.title3)
                        .fontWeight(.semibold)
                    +
                    Text("(Recent)")
                        .foregroundStyle(.bumbleGray)
                        .fontWeight(.bold)
                }
                
                Spacer(minLength: 0)
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title2)
            }
            .padding(.horizontal, 16)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 16) {
                    ForEach(allUsers) { user in
                        BumbleChatPreviewCell(
                            imageName: user.images.randomElement()!,
                            percentageRemaining: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe,
                            isYourMove: Bool.random()
                        )
                    }
                }
                .padding(16)
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    RouterView { _ in
        BumbleChatsView()        
    }
}
