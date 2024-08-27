//
//  NetflixShareButton.swift
//  UIAppsDemo
//
//  Created by Simeon Ivanov on 7.08.24.
//

import SwiftUI

struct NetflixShareButton: View {
    
    var url: String = "https://www.apple.com"
    
    var body: some View {
        if let url = URL(string: url) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(.black.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixShareButton()
    }
}
