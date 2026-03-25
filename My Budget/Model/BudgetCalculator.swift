//
//  BudgetCalculator.swift
//  My Budget
//
//  Created by Вавилов Илья on 25/3/26.
//

import Foundation

class BudgetCalculator {
    var budget: Int
    
    init(budget: String) {
        self.budget = Int(budget) ?? 0
    }
    
    func calculate() -> String {
        return "\((budget - 2728) / 22)"
    }
}
