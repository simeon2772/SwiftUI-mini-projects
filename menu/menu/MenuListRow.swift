//
//  MenuListRow.swift
//  menu
//
//  Created by Simeon Ivanov on 21.06.23.
//

import SwiftUI

struct MenuListRow: View {
    
    var item: MenuItem
    
    var body: some View {

        HStack {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .cornerRadius(13)
            Text(item.name)
                .bold()
            Spacer()
            Text(item.price)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(
            Color(.brown).opacity(0.2))
    }
}

struct MenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuListRow(item: MenuItem(name: "Test", price: "3.99", imageName: "tako-sushi"))
    }
}
