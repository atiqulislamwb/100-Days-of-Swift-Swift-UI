//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Atiqul Islam on 2/3/24.
//

import SwiftUI
import SwiftData
@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
