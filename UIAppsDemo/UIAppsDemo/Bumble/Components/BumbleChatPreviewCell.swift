//
//  BumbleChatPreviewCell.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var userName: String = "Simeon"
    var lastChatMessage: String? = "This is the last message"
    var isYourMove: Bool = true
    
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(imageName: imageName, percentageRemaining: percentageRemaining, hasNewMessage: hasNewMessage)
            
            VStack(spacing: 4) {
                HStack(alignment: .top) {
                    Text(userName)
                        .fontWeight(.semibold)
                        .foregroundStyle(.bumbleBlack)
                    
                    Spacer()
                    
                    if isYourMove {
                        Text("YOUR MORE")
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .padding(4)
                            .background(.bumbleYellow ,in: .rect(cornerRadius: 20))
                    }
                }
                
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.bumbleGray)
                        .lineLimit(1)
                        .padding(.trailing, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    
    VStack {
        BumbleChatPreviewCell(isYourMove: false)
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
        BumbleChatPreviewCell()
    }
    .padding(12)
}
