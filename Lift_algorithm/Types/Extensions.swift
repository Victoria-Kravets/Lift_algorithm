//
//  Extensions.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 10.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func remove(object: Array.Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}
