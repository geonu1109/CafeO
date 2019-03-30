//
//  Drink.swift
//  CafeO
//
//  Created by 전건우 on 30/03/2019.
//  Copyright © 2019 geonu. All rights reserved.
//

import Foundation

class Drink: Equatable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return (lhs.name == rhs.name)
    }
    
    enum Category: String, CaseIterable {
        case coffee = "커피"
        case tea = "차"
    }
    
    let name: String
    let cat: Category
    
    init(name: String, cat: Category) {
        self.name = name
        self.cat = cat
    }
}
