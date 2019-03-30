//
//  DrinkOrderRepository.swift
//  CafeO
//
//  Created by 전건우 on 30/03/2019.
//  Copyright © 2019 geonu. All rights reserved.
//

import Foundation
import RxSwift

class DrinkOrderRepository {
    typealias Orders = [Drink.Category: [DrinkOrder]]
    
    static let shared = DrinkOrderRepository()
    
    var orders: Orders
    let ordersSubject: BehaviorSubject<Orders>
    
    private init() {
        orders = [:]
        for cat in Drink.Category.allCases {
            orders[cat] = []
        }
        ordersSubject = .init(value: orders)
    }
    
    func find(item: Drink, temp: DrinkOrder.Temperature) -> Int? {
        for i in 0 ..< orders[item.cat]!.count {
            if (orders[item.cat]![i].item == item) && (orders[item.cat]![i].temp == temp) {
                return i
            }
        }
        return nil
    }
    
    func add(item: Drink, temp: DrinkOrder.Temperature) {
        if find(item: item, temp: temp) == nil {
            orders[item.cat]?.append(.init(item: item, temp: temp))
            ordersSubject.onNext(orders)
        }
    }
    
    func remove(item: Drink, temp: DrinkOrder.Temperature) {
        if let index = find(item: item, temp: temp) {
            orders[item.cat]!.remove(at: index)
            ordersSubject.onNext(orders)
        }
    }
}
