//
//  RecipeCategoryGridView.swift
//  CookingApp
//
//  Created by Simeon Ivanov on 23.10.23.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    @State private var recipeData = RecipeViewModel()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases,
                            id: \.self) { category in
                        NavigationLink(
                            destination: ContentView(category: category)
                                .environment(recipeData),
                            label: {
                                CategoryView(category: category)
                            })
                    }
                })
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .scaledToFit()
                .opacity(0.55)
            Text(category.rawValue)
                .font(.title)
        }
    }
}
#Preview {
    RecipeCategoryGridView()
        .preferredColorScheme(.dark)
}
