//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Azure May Burmeister on 2/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    let tipOptionArray: [Int] = [0, 10, 20]
    var subtotal: Double = 0.0
    var tip: Int = 10
    var split: Double = 1
    var total: Double?
    var totalPP: Double?
    
    mutating func updateTip(ind: Int) {
        tip = tipOptionArray[ind]
    }
    
    mutating func calculateTotalPP() {
        total = (subtotal * Double(100 + tip)) / 100
        totalPP = (total ?? 0.0) / split
    }
    
    func returnResult() -> Result {
        let result = Result(r: String(format: "%.2f", totalPP ?? 0.00), m: "Split between \(Int(split)) people, with \(tip)% tip.")
        return(result)
    }
}
