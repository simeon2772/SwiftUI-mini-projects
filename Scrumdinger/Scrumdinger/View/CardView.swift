//
//  CardView.swift
//  Scrumdinger
//
//  Created by Simeon Ivanov on 2.10.23.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview("CardView") {
    var scrum = DailyScrum.sampleData[0]
    return CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        .previewLayout(.fixed(width: 400, height: 60))
}
