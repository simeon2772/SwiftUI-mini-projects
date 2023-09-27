//
//  little_lemon_dinner_menuTests.swift
//  little lemon dinner menuTests
//
//  Created by Simeon Ivanov on 31.07.23.
//

import XCTest
@testable import little_lemon_dinner_menu

final class LittleLemonDinnerMenuTests: XCTestCase {
    let viewModel = MenuViewViewModel()
    
    func test_checkFoodTitle() {
        let foodTitle = viewModel.foods[0]
        XCTAssertEqual(foodTitle.title, "Food 4")
    }
    
    func test_checkIngredient() {
        let foodIngredient = viewModel.foods[0]
        XCTAssertEqual(foodIngredient.ingredient, [.tomatoSauce, .carrot, .pasta])
    }

}
