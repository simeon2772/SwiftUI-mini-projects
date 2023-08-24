//
//  ContentView.swift
//  WeSplit
//
//  Created by Simeon Ivanov on 24.06.23.
//

import SwiftUI



struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercent = 20
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [0, 10, 15, 20, 25, 30]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercent)
        
        let tipValue = checkAmount / 100 * tipSelection
        let total = checkAmount + tipValue
        let amountPerPerson = total / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: "BGN"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {Text("\($0) people")}
                    }
                }
            
                Section {
                    Picker("Tip Percentage", selection: $tipPercent) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip you want to leave")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: "BGN"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
