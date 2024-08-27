//
//  NetflixHomeView.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 6.08.24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct NetflixHomeView: View {
    
    @Environment(\.router) var router
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel? = nil
    @State private var fullHeaderSize: CGSize = .zero
    @State private var scrollViewOffset: CGFloat = 0
    
    @State private var heroProduct: Product? = nil
    @State private var currentUser: User? = nil
    @State private var productRow: [ProductRow] = []

    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            backgroundGradientLayer
            
            scrollViewLayer
        
            fullHeaderWithFilters
            
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var backgroundGradientLayer: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .netflixDarkGray,
                    .netflixDarkGray.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            LinearGradient(
                colors: [
                    .netflixDarkRed.opacity(0.6),
                    .netflixDarkRed.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .frame(maxHeight: max(10, (400 + (scrollViewOffset * 0.75))))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    
    private var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false,
            content: {
                Rectangle()
                    .frame(width: fullHeaderSize.width, height: fullHeaderSize.height)
                    .opacity(0)
                
                if let heroProduct {
                    heroCell(product: heroProduct)
                }
                
                categoryRows
            },
            onScrollChanged: { offset in
                scrollViewOffset = min(0, offset.y)
            }
        )
    }
    
    private func onProductPressed(product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixDetailsView(product: product)
        }
    }
    
    private var fullHeaderWithFilters: some View {
        VStack(spacing: 0) {
            header
                .padding(.horizontal, 16)
                
            if scrollViewOffset > -20 {
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter,
                    onXMarkPressed: {
                        selectedFilter = nil
                    },
                    onFilterPressed: { newFilter in
                        selectedFilter = newFilter
                    }
                )
                .padding(.top, 16)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        
        }
        .padding(.bottom, 8)
        .background {
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        }
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            if fullHeaderSize == .zero {
                fullHeaderSize = frame.size
            }
        }
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .fontWeight(.bold)
                .onTapGesture {
                    router.dismissScreen()
                }
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
    
    private func heroCell(product: Product) -> some View {
        NetflixHeroCell(
            imageName: product.firstImage,
            isNetflixFilm: true,
            title: product.title,
            categories: [product.brand!.capitalized, product.category.capitalized],
            onBackgroundPressed: {
                onProductPressed(product: product)
            },
            onPlayPressed: {
                
            },
            onMyListPressed: {
                
            }
        )
        .padding(24)
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(productRow.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { (index, product) in
                                NetflixMovieCell(
                                    imageName: product.firstImage,
                                    title: product.title,
                                    isRecentlyAdded: product.recentlyAdded,
                                    topTenRanking: rowIndex == 1 ? index + 1 : nil
                                )
                                .onTapGesture {
                                    router.showScreen(.sheet) { _ in
                                        NetflixDetailsView(product: product)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    
    private func getData() async {
        guard productRow.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let products = try await Array(DatabaseHelper().getProduct().prefix(8))
            heroProduct = products[7]
            
            var rows: [ProductRow] = []
            let allTitles = Set(products.map { $0.title })
            for title in allTitles {
                rows.append(ProductRow(title: title.capitalized, products: products.shuffled()))
            }
            productRow = rows
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    RouterView { _ in
        NetflixHomeView()
    }
}
