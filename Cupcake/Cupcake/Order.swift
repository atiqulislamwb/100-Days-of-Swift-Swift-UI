//
//  Order.swift
//  Cupcake
//
//  Created by Atiqul Islam on 14/2/24.
//

import Foundation

struct Order:Codable {
    static var types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

  
    var extraFrosting = false
    var addSprinkles = false
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
    
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
    
}
