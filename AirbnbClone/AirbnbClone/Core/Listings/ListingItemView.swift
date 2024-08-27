//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Simeon Ivanov on 5.06.24.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = ["listing-1", "listing-2", "listing-3"]
    var body: some View {
        VStack(spacing: 8) {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .frame(height: 320)
            .clipShape(.rect(cornerRadius: 10))
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                    
                    Text("12 mi away")
                        .foregroundStyle(.secondary)
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.secondary)
                    
                    HStack(spacing: 3) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("4.86")
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
