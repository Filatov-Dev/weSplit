//
//  ContentView.swift
//  WeSplit
//
//  Created by Юрий Филатов on 08.07.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPersantage = 2
    
    let tipPersantages = [10, 15, 20, 25, 0]
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPersantages[tipPersantage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 + tipSelection
        let grendTotal = orderAmount + tipValue
        let amountPerPerson = grendTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of people:", selection: $numberOfPeople){
                        ForEach(2..<10){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave ?")){
                    Picker("Tip persantage", selection: $tipPersantage){
                        ForEach(0..<tipPersantages.count){
                            Text("\(self.tipPersantages[$0])%")
                        }
                        
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
