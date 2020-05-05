//
//  Result.swift
//  Tipsy
//
//  Created by Azure May Burmeister on 2/21/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Result {
    let result: String
    let message: String
    
    init(r: String, m: String) {
        result = r
        message = m
    }
}
