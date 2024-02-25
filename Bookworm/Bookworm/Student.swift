//
//  Student.swift
//  Bookworm
//
//  Created by Atiqul Islam on 21/2/24.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
