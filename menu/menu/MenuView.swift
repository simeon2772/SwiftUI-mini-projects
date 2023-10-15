//
//  ContentView.swift
//  menu
//
//  Created by Simeon Ivanov on 20.06.23.
//

import SwiftUI

struct MenuView: View {
    
    @State var menuItems: [MenuItem] = [MenuItem]()
    var dataService = DataService()
    
    var body: some View {
       
        List(menuItems) { item in
            
            MenuListRow(item: item)

        }
        .listStyle(.plain)
        .onAppear {
            // Call for data
            menuItems = dataService.getData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
