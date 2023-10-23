//
//  RecipeViewModel.swift
//  CookingApp
//
//  Created by Simeon Ivanov on 18.10.23.
//

import Foundation
import Observation

@Observable
class RecipeViewModel {
    var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe] {
        var filteredRecipes = [Recipe]()
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
}
