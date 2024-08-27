//
//  NetflixDetailsProductView.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 7.08.24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsProductView: View {
    
    var title: String = "Movie Title"
    var isNew: Bool = true
    var yearReleased: String = "2024"
    var seasonCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 6
    var descriptionText: String = "This is the description for this movie serias, it is amazing! It's called Tower 4 , I am listening to it right now and it is really engaching actually."
    var castText: String = "Cast: Simeon, Mike, Amber, Gine"
    var onPlayPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                        .fontWeight(.semibold)
                }
                
                Text(yearReleased)
                
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                
                if hasClosedCaptions {
                    Image(systemName: "captions.bubble")
                }
            }
            .foregroundStyle(.netflixLightGray)
            
            HStack {
                ZStack {
                    VStack(spacing: 0) {
                        Text("TOP")
                            .font(.system(size: 8, weight: .semibold))
                            .offset(y: 2)
                        Text("10")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                .frame(width: 35, height: 35)
                .background(.netflixRed)
                
                if let isTopTen {
                    Text("#\(isTopTen) in TV Shows Today")
                }
            }
            .fontWeight(.semibold)
            
            HStack {
                Image(systemName: "play.fill")
                
                Text("Play")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixDarkGray)
            .background(.netflixWhite, in: .rect(cornerRadius: 4))
            .asButton(.press) {
                onPlayPressed?()
            }
            
            HStack {
                Image(systemName: "arrow.down.to.line.compact")
                
                Text("Download")
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .foregroundStyle(.netflixWhite)
            .background(.netflixDarkGray, in: .rect(cornerRadius: 4))
            .asButton(.press) {
                onDownloadPressed?()
            }
            
            Group {
                Text(descriptionText)
                    .fontWeight(.medium)
                    .lineLimit(3)
                
                Text(castText)
                    .offset(y: 8)
                    .foregroundStyle(.netflixLightGray)
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.netflixWhite)
//        .padding(16)
    }
}

#Preview(/*traits: .fixedLayout(width: 400, height: 200)*/) {
    ZStack {
        Color.black.ignoresSafeArea()
            NetflixDetailsProductView()
    }
}
