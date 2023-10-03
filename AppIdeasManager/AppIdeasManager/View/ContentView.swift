//
//  ContentView.swift
//  AppIdeasManager
//
//  Created by Simeon Ivanov on 2.10.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var ideas: [AppIdea]
    
    @State private var showAddDialog = false
    @State private var newName = ""
    @State private var newDescription = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if ideas.isEmpty {
                    ContentUnavailableView("No app ideas", systemImage: "pencil.slash")
                } else {
                    List(ideas) { idea in
                        AppIdeaListRow(idea: idea)
                    }
                }
            }
            .navigationTitle("App ideas")
            .navigationDestination(for: AppIdea.self) { EditAppIdeaView(idea: $0) }
            .toolbar {
                Button("Add") {
                    showAddDialog.toggle()
                }
            }
            .sheet(isPresented: $showAddDialog) {
                NavigationStack {
                    Form {
                        TextField("Name", text: $newName)
                        TextField("Description", text: $newDescription, axis: .vertical)
                    }
                    .navigationTitle("New App Idea")
                    .toolbar {
                        Button("Dismiss") {
                            showAddDialog.toggle()
                        }
                        
                        Button("Save") {
                            let idea = AppIdea(name: newName, detailedDescription: newDescription)
                            
                            context.insert(idea)
                            showAddDialog.toggle()
                        }
                    }
                }
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [AppIdea.self, AppFeature.self], inMemory: true)
}
