//
//  NetflixHeroCell.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 6.08.24.
//

import SwiftUI
import SwiftfulUI

struct NetflixHeroCell: View {
    
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onMyListPressed: (() -> Void)? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
                .background(.white.opacity(0.2))
            
            VStack(spacing: 16) {
                VStack(spacing: 0) {
                    if isNetflixFilm {
                        HStack(spacing: 8) {
                            Text("N")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundStyle(.netflixRed)
                            
                            Text("FILM")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixWhite)
                        }
                    }
                    
                    Text(title)
                        .font(.system(size: 50, weight: .medium, design: .serif))
                        .lineLimit(1)
                }
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle()
                                .frame(width: 4, height: 4)
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    HStack {
                        Image(systemName: "play.fill")
                        
                        Text("Play")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixWhite)
                    .background(.netflixDarkGray, in: .rect(cornerRadius: 4))
                    .asButton(.press) {
                        onPlayPressed?()
                    }
                    
                    HStack {
                        Image(systemName: "plus")
                        
                        Text("My List")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixWhite)
                    .background(.netflixDarkGray, in: .rect(cornerRadius: 4))
                    .asButton(.press) {
                        onMyListPressed?()
                    }
                }
                .font(.callout)
                .fontWeight(.medium)
            }
            .padding(24)
            .background {
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0),
                        .netflixBlack.opacity(0.3),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4)
                            ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
            
        }
        .aspectRatio(0.8, contentMode: .fit)
        .clipShape(.rect(cornerRadius: 10))
        .foregroundStyle(.netflixWhite)
        .asButton(.tap) {
            onBackgroundPressed?()
        }
    }
}

#Preview {
    NetflixHeroCell()
        .padding(.horizontal, 24)
}
