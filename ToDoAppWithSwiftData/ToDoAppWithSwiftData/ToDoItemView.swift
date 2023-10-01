//
//  ToDoItemView.swift
//  ToDoAppWithSwiftData
//
//  Created by Simeon Ivanov on 29.09.23.
//

import SwiftUI

struct ToDoItemView: View {
    @Environment(\.modelContext) private var context
    var toDo: ToDo
    
    var body: some View {
        HStack {
            Image(systemName: toDo.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(toDo.isDone ? .green : .red)
            
            Text(toDo.item)
                .strikethrough(toDo.isDone ? true : false)
                .foregroundStyle(toDo.isDone ? .secondary : .primary)
        }
        .swipeActions {
            Button(toDo.isDone ? "Not Done" : "Done") {
                toDo.isDone.toggle()
                persistData(for: toDo)
            }
            .tint(toDo.isDone ? .red : .green)
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

