//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Simeon Ivanov on 2.10.23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Meeting Info")) {
                    NavigationLink(destination: MeetingView(scrum: $scrum)) {
                        Label("Start Meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    HStack {
                        Label("Length", systemImage: "clock")
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minutes")
                    }
                    .accessibilityElement(children: .combine)
                    HStack {
                        Label("Theme", systemImage: "paintpalette")
                        Spacer()
                        Text(scrum.theme.name)
                            .padding(4)
                            .foregroundStyle(scrum.theme.accentColor)
                            .background(scrum.theme.mainColor)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                    .accessibilityElement(children: .combine)
                }
                
                Section(header: Text("Attendees")) {
                    ForEach(scrum.attendees) { attendee in
                        Label(attendee.name, systemImage: "person")
                    }
                }
                
                Section(header: Text("History")) {
                    if scrum.history.isEmpty {
                        Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                    }
                    ForEach(scrum.history) { history in
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
            .navigationTitle(scrum.title)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    editingScrum = scrum
                }
            }
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    DetailEditView(scrum: $editingScrum)
                        .navigationTitle(scrum.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    scrum = editingScrum
                                }
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    DetailView(scrum: .constant(DailyScrum.sampleData[0]))
}
