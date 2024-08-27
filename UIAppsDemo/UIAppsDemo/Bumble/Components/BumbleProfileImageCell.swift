//
//  BumbleProfileImageCell.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray ,lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(.degrees(-90))
                .scaleEffect(x: -1, y: 1.0, anchor: .center)
                
            ImageLoaderView(urlString: imageName)
                .clipShape(.circle)
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay(alignment: .bottomTrailing) {
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                        .shadow(radius: 1)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        BumbleProfileImageCell()
        BumbleProfileImageCell(hasNewMessage: false)
        BumbleProfileImageCell()
    }
}
