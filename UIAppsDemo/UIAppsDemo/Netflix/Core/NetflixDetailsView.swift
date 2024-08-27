//
//  NetflixDetailsView.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 7.08.24.
//

import SwiftUI
import SwiftfulRouting

struct NetflixDetailsView: View {
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    @State private var progress: Double = 0.3
    @State private var isInMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirPlayPressed: {
                        
                    },
                    onXmarkPressed: {
                        router.dismissScreen()
                    }
                )
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        productsDetailsSection
                        
                        buttonsSection
                        
                        productsGridSection
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
    }
    
    private var productsGridSection: some View {
        VStack(alignment: .leading) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 12) {
                ForEach(products) { product in
                    NetflixMovieCell(
                        imageName: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                }
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var buttonsSection: some View {
        HStack(spacing: 32) {
            NetflixMyListButton(isInMyList: isInMyList) {
                isInMyList.toggle()
            }
            
            NetflixRateButton { selection in
                // do something with selection
            }
            
            NetflixShareButton()
        }
        .padding(.leading, 32)
        .padding(.top, 8)
    }
    
    private var productsDetailsSection: some View {
        NetflixDetailsProductView(
            title: product.title,
            isNew: true,
            yearReleased: "2024",
            seasonCount: 4,
            hasClosedCaptions: true,
            isTopTen: 1,
            descriptionText: product.description,
            castText: "Cast: Simeon, Mike, Amber, Gine, Jerry",
            onPlayPressed: {
                
            },
            onDownloadPressed: {
                
            }
        )
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await Array(DatabaseHelper().getProduct().prefix(8))
            print(products.count)
        } catch {
            print(error.localizedDescription)
        }
    }

}

#Preview {
    NetflixDetailsView()
}
