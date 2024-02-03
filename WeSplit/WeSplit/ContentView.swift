//
//  ContentView.swift
//  WeSplit
//
//  Created by Atiqul Islam on 3/2/24.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
   
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount)
            }
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
