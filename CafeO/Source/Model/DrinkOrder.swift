//
//  DrinkOrder.swift
//  CafeO
//
//  Created by 전건우 on 30/03/2019.
//  Copyright © 2019 geonu. All rights reserved.
//

import Foundation
import RxSwift

class DrinkOrder: Equatable {
    static func == (lhs: DrinkOrder, rhs: DrinkOrder) -> Bool {
        return (lhs.item == rhs.item) && (lhs.temp == rhs.temp)
    }
    
    enum Temperature: String {
        case hot = "뜨거운"
        case ice = "차가운"
    }
    
    let item: Drink
    let temp: Temperature
    var count: Int = 1 {
        didSet {
            countSubject.onNext(count)
        }
    }
    let countSubject: BehaviorSubject<Int> = .init(value: 1)
    
    init(item: Drink, temp: Temperature) {
        self.item = item
        self.temp = temp
    }
}
