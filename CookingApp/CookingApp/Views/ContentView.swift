//
//  ContentView.swift
//  CookingApp
//
//  Created by Simeon Ivanov on 18.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var recipeData = RecipeViewModel()
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        Text(recipe.mainInformation.name)
                    }
                }
                .listRowBackground(listBackgroundColor)
                .foregroundStyle(listTextColor)
            }
            .navigationTitle(navTitle)
        }
    }
}

extension ContentView {
      private var recipes: [Recipe] {
          recipeData.recipes(for: category)
      }
      
      private var navTitle: String {
        "\(category.rawValue) Recipes"
      }
}


#Preview {
    ContentView(category: .breakfast)
}
