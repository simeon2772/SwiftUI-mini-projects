//
//  MenuItemDetailsView.swift
//  little lemon dinner menu
//
//  Created by Simeon Ivanov on 31.07.23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        NavigationStack {
            Image("Little Lemon logo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            if menuItem.price > 0 {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.ordersCount > 0 {
                VStack {
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text("\(menuItem.ordersCount)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
            
        }
        .navigationTitle(menuItem.title)
        .padding([.leading, .trailing], 60)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = MenuItem(price: 10, title: "Food 1", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce])
        MenuItemDetailsView(menuItem: menuItem)
    }
}
