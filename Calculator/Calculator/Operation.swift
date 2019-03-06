//
//  Operation.swift
//  Calculator
//
//  Created by Avinash on 2/14/19.
//  Copyright © 2019 SecondGenPESH. All rights reserved.
//

import Foundation

enum Operation: String {
    case add = "+"
    case subtract = "-"
    case multiply = "x"
    case divide = "÷"
    
    
    func performOperation(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .multiply:
            return lhs * rhs
        case .divide:
            return lhs / rhs
        }
    }
    
    
}
