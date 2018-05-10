//
//  Passenger.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 10.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public class Passenger {
    
    // MARK: -
    // MARK: Properties
    
    public var isUp: Bool
    public var currentNumberFloor: Int
    public var finalNumberFloor: Int
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(isUp: Bool, currentNumberFloor: Int, finalNumberFloor: Int) {
        self.isUp = isUp
        self.currentNumberFloor = currentNumberFloor
        self.finalNumberFloor = finalNumberFloor
    }
}

extension Passenger: Equatable  {
    public static func ==(lhs: Passenger, rhs: Passenger) -> Bool {
        if lhs.currentNumberFloor == rhs.currentNumberFloor {
            if lhs.finalNumberFloor == rhs.finalNumberFloor {
                if lhs.isUp == rhs.isUp {
                    return true
                }
            }
        }
        
        return false
    }
}
