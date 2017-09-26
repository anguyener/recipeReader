//
//  Ingredient.swift
//  RecipieReader
//
//  Created by Anna Nguyen on 9/26/17.
//  Copyright © 2017 Anna Nguyen. All rights reserved.
//

import Foundation

struct Ingredient {
    let quantity: String
    let name: String
    let type: String
    
    init(quantity: String, name: String, type: String) {
        self.quantity = quantity
        self.name = name
        self.type = type
    }
    
    init(dictionary: [String: String]) {
        self.init(quantity: dictionary["quantity"]!, name: dictionary["name"]!, type: dictionary["type"]!)
    }
}
