//
//  ContentView.swift
//  MyBMICalculator
//
//  Created by Haikal Lazuardi Fadil on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCalculator = 0
    @State private var weight: Double = 60
    @State private var height: Double = 175
    @State private var savedHistories = [
        Bmi(date: Date(), result: 24)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $isCalculator) {
                    Text("Calculator").tag(0)
                    Text("History").tag(1)
                }
                .pickerStyle(.segmented)
                
                if isCalculator == 0 {
                    CalculatorView(weight: $weight, height: $height, savedHistories: $savedHistories)
                }
                else {
                    HistoryView(savedHistories: $savedHistories)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(Text("BMI Calculator"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

