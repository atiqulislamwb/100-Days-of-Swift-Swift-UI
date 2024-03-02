//
//  ContentView.swift
//  HotProspects
//
//  Created by Atiqul Islam on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var output = ""

    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
//        do {
//            output = try result.get()
//        } catch {
//            output = "Error: \(error.localizedDescription)"
//        }
        
        //alternative
        switch result {
            case .success(let str):
                output = str
            case .failure(let error):
                output = "Error: \(error.localizedDescription)"
        }
        
    }
    @State private var backgroundColor = Color.red

    var body: some View {
//        Text(output)
//                   .task {
//                       await fetchReadings()
//                   }
        VStack {
                  Text("Hello, World!")
                      .padding()
                      .background(backgroundColor)

                  Text("Change Color")
                      .padding()
                      .contextMenu {
                          Button("Red") {
                              backgroundColor = Color.red
                          }

                          Button("Green") {
                              backgroundColor = Color.green
                          }

                          Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                              backgroundColor = Color.yellow
                          }
                      }
              }
    }
}

#Preview {
    ContentView()
}
