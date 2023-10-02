//
//  DestinationListingView.swift
//  SwiftDataDemoExer
//
//  Created by Simeon Ivanov on 1.10.23.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDest)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
        
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }
        ,sort: [sort])
    }
    
    func deleteDest(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            context.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
