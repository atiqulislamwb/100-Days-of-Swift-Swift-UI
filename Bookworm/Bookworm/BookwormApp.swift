//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Atiqul Islam on 21/2/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
