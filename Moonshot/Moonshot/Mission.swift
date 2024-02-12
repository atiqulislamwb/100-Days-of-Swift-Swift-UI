//
//  Mission.swift
//  Moonshot
//
//  Created by Atiqul Islam on 12/2/24.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
}

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
