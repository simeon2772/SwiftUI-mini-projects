//
//  HomeView.swift
//  AssessmentNewsApp
//
//  Created by Simeon Ivanov on 20.09.24.
//

import SwiftUI

// if os IOS18 View already on MainActor
// if os IOS17 @MainActor should be added to View
//@MainActor
struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    @State private var selectedCategory: Categories = .general
    @State private var showSearchBar = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filteredArticles) { article in
                    NavigationLink {
                        ArticleDetailsView(article: article)
                    } label: {
                        ArticleCellView(article: article)
                    }
                }
            }
            .scrollIndicators(.never)
            .listStyle(.grouped)
            .searchable(text: $viewModel.searchText, isPresented: $showSearchBar)
            .navigationTitle("US News")
            .task {
                do {
                    if viewModel.articles.isEmpty {
                        viewModel.articles = try await viewModel.getData(category: selectedCategory)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Categories", systemImage: "newspaper.fill") {
                        ForEach(Categories.allCases, id: \.self) { category in
                            Button {
                                selectedCategory = category
                                viewModel.articles = []
                                Task {
                                    do {
                                        viewModel.articles = try await viewModel.getData(category: category)
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                }
                            } label: {
                                Text(category.rawValue.capitalized)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

