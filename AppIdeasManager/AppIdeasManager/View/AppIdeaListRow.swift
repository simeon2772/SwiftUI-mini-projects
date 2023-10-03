//
//  AppIdeaListRow.swift
//  AppIdeasManager
//
//  Created by Simeon Ivanov on 2.10.23.
//

import SwiftUI

struct AppIdeaListRow: View {
    @Environment(\.modelContext) private var context
    var idea: AppIdea
    
    var body: some View {
        NavigationLink(value: idea) {
            VStack(alignment: .leading) {
                Text(idea.name)
                
                Text(idea.detailedDescription)
                    .textScale(.secondary)
                    .foregroundStyle(.secondary)
            }
        }
        .swipeActions {
            Button(role: .destructive) {
                context.delete(idea)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}
