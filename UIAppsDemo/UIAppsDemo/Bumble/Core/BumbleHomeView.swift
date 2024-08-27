//
//  BumbleHomeView.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct BumbleHomeView: View {
    
    @Environment(\.router) var router
    @State private var filters: [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_filter") private var selectedFilter = "Everyone"
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffsets: [Int : Bool] = [:] // key - userId : Direction is right == TRUE
    @State private var currentSwipeOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                
                BumbleFilterView(filters: filters, selectedFilter: $selectedFilter)
                    .background(alignment: .bottom) { Divider() }
                
//                BumbleCardView()
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1) == index
                            
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOffsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                    
                    overlaySwipingIndicators
                        .zIndex(99)
                }
                .animation(.smooth, value: cardOffsets)
                .padding(4)
                .frame(maxHeight: .infinity)
            }
            .padding(8)
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
    
    private func userDidSelect(index: Int, isLiked: Bool) {
        let user = allUsers[index]
        cardOffsets[user.id] = isLiked
        
        selectedIndex += 1
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }

            }
            .frame(maxWidth: .infinity, alignment: .leading)

            
            Text("Bumble")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
                .fontWeight(.bold)
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push) { _ in
                        BumbleChatsView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
    }
    
    private var overlaySwipingIndicators: some View {
        ZStack {
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1)
                .offset(x: min(-currentSwipeOffset, 150))
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -100)
            
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60, height: 60)
                .scaleEffect(abs(currentSwipeOffset) > 100 ? 1.5 : 1)
                .offset(x: max(-currentSwipeOffset, -150))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .offset(x: 100)
        }
        .animation(.smooth, value: currentSwipeOffset)
    }
    
    private func userProfileCell(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            onSuperLikePressed: nil,
            onXmarkPressed: {
                userDidSelect(index: index, isLiked: false)
            },
            onCheckMarkPressed: {
                userDidSelect(index: index, isLiked: true)
            },
            onSendAComplimentPressed: nil,
            onHideAndReportPressed: {
                
            }
        )
            .withDragGesture(
                .horizontal,
                minimumDistance: 15,
                resets: true,
                rotationMultiplier: 1.05,
                onChanged: { dragOffset in
                    currentSwipeOffset = dragOffset.width
                },
                onEnded: { dragOffset in
                    if dragOffset.width < -50 {
                        userDidSelect(index: index, isLiked: false)
                    } else if dragOffset.width > 50 {
                        userDidSelect(index: index, isLiked: true)
                    }
                }
            )
    }
}

#Preview {
    RouterView { _ in
        BumbleHomeView()
    }
}
