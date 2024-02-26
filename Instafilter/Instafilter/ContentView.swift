//
//  ContentView.swift
//  Instafilter
//
//  Created by Atiqul Islam on 26/2/24.
//

import SwiftUI

struct ContentView: View {
  

        @State private var showingConfirmation = false
           @State private var backgroundColor = Color.white

    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
}
#Preview {
    ContentView()
}
