//
//  BumbleFilterView.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI

struct BumbleFilterView: View {
    
    @Namespace private var namespace
    var filters: [String] = ["Everyone", "Trending"]
    @Binding var selectedFilter: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            ForEach(filters, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.headline)
                        .fontWeight(.medium)
                    
                    if selectedFilter == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                }
                .padding(.top, 8)
                .background(.black.opacity(0.001))
                .foregroundStyle(selectedFilter == option ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selectedFilter = option
                }
            }
        }
        .animation(.smooth, value: selectedFilter)
    }
}

fileprivate struct BumbleFilterViewPreview: View {
    
    var filters: [String] = ["Everyone", "Trending"]
    @State private var selectedFilter = "Everyone"
    
    var body: some View {
        BumbleFilterView(filters: filters, selectedFilter: $selectedFilter)
    }
}

#Preview {
    BumbleFilterViewPreview()
        .padding(.horizontal, 8)
}
