//
//  SearchAndFilterBar.swift
//  AirbnbClone
//
//  Created by Simeon Ivanov on 5.06.24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Miami")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Any Week - Add guests")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button {
                // action
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray3))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
