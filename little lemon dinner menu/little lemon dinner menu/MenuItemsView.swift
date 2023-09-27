//
//  MenuItemsView.swift
//  little lemon dinner menu
//
//  Created by Simeon Ivanov on 31.07.23.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.isShowFood {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            .onAppear() {
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar {
                Button(action: {
                    viewModel.isOpenedOptionView.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            .sheet(isPresented: $viewModel.isOpenedOptionView) {
                NavigationStack {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            Button("Done") {
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
