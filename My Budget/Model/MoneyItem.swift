//
//  MoneyItem.swift
//  My Budget
//
//  Created by Вавилов Илья on 22/3/26.
//

import Foundation
import SwiftData

@Model
class MoneyItem {
    var money: Int
    
    init(money: Int) {
        self.money = money
    }
}
