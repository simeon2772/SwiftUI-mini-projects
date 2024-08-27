//
//  NetflixFilterCell.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 6.08.24.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background {
            Capsule(style: .circular)
                .fill(.netflixDarkGray)
                .opacity(isSelected ? 1 : 0)
            
            Capsule(style: .circular)
                .stroke(lineWidth: 1)
        }
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        VStack {
            NetflixFilterCell()
            NetflixFilterCell(title: "Movies", isDropdown: false, isSelected: true)
            NetflixFilterCell(title: "TV Shows", isDropdown: false, isSelected: false)
        }
    }
}
