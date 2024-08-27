//
//  SpotifyRecentsCell.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 4.08.24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title = "Some Random title"
    
    var body: some View {
        HStack(spacing: 10) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
               
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
            
            Spacer()
        }
        .foregroundStyle(.spotifyWhite)
        .background(.spotifyDarkGray ,in: .rect(cornerRadius: 6))
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        VStack {
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack {
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
