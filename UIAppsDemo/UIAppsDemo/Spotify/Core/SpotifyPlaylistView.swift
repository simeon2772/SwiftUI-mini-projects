//
//  SpotifyPlaylistView.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyPlaylistView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    var user: User = .mock
    @State private var products: [Product] = []
    @State private var showHeader = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            //
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand!,
                        imageName: product.thumbnail
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 145
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.brand!
                    )
                    .padding(.horizontal, 10)
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 55,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.description,
                            onCellPressed: nil,
                            onEllipsisPressed: nil
                        )
                        .padding(.leading, 8)
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .offset(y: showHeader ? 0 : -40)
                    .opacity(showHeader ? 1: 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showHeader ? .black.opacity(0.001) : .spotifyGray.opacity(0.6), in: .circle)
                    .onTapGesture {
                        router.dismissScreen()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.3), value: showHeader)
            .frame(maxHeight: .infinity, alignment: .top)
            
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProduct()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
