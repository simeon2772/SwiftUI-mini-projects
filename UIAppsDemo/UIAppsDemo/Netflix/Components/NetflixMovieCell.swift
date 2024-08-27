//
//  NetflixMovieCell.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 6.08.24.
//

import SwiftUI

struct NetflixMovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int? = nil
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                    .background(.white.opacity(0.2))
                
                VStack(spacing: 0) {
                    if let title, let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .frame(maxWidth: .infinity)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .background(.netflixRed, in: .rect(cornerRadii: .init(topLeading: 2, bottomLeading: 0, bottomTrailing: 0, topTrailing: 2)))
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background {
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0.01),
                            .netflixBlack.opacity(0.2),
                            .netflixBlack.opacity(0.3),
                            .netflixBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
            }
            .frame(width: width, height: height)
            .clipShape(.rect(cornerRadius: 4))
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview(traits: .fixedLayout(width: 220, height: 550)) {
    ZStack {
        Color.black
        VStack {
            NetflixMovieCell(isRecentlyAdded: false)
            NetflixMovieCell(topTenRanking: 3)
            NetflixMovieCell(topTenRanking: 10)
        }
    }
}

