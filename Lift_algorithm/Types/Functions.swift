//
//  Functions.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 09.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

func randomBool() -> Bool {
    return arc4random_uniform(2) == 0
}
