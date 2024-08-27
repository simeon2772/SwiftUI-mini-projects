//
//  InterestPillView.swift
//  SpotifyUIDemoApp
//
//  Created by Simeon Ivanov on 5.08.24.
//

import SwiftUI

struct InterestPillView: View {
    
    var iconName: String? = "heart.fill"
    var emoji: String? = "🫡"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack(spacing: 4) {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoji {
                Text(emoji)
            }
            
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleYellow.opacity(0.6), in: .rect(cornerRadius: 32))
    }
}

#Preview {
    VStack {
        InterestPillView()
        InterestPillView(iconName: "suitcase", emoji: nil, text: "Bussinesmen")
        InterestPillView(iconName: nil, emoji: "🤗", text: "haha")
    }
}
