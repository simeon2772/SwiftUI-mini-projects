//
//  ContentView.swift
//  ToDoAppWithSwiftData
//
//  Created by Simeon Ivanov on 29.09.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query var allToDos: [ToDo]
    @State private var isAddToDoSheetShowing = false
    @State private var textField = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if allToDos.isEmpty {
                    ContentUnavailableView("Nothing to do here", systemImage: "list.bullet.clipboard")
                } else {
                    List {
                        ForEach(allToDos.sorted { $0.isDone && !$1.isDone}) { toDo in
                                ToDoItemView(toDo: toDo)
                        }
                    }
                }
            }
            .navigationTitle("ToDo List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAddToDoSheetShowing.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
            .sheet(isPresented: $isAddToDoSheetShowing) {
                VStack {
                    TextField("Make a ToDo", text: $textField)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    Button("Save") {
                        persistData(for: ToDo(item: textField, isDone: false))
                        textField = ""
                        isAddToDoSheetShowing.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    func persistData(for toDo: ToDo) {
        context.insert(toDo)
        
        do {
            try context.save()
        } catch {
            print("The following error occured \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
