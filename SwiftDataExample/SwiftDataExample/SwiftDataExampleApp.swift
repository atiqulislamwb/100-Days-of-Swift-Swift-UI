//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Atiqul Islam on 25/2/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
