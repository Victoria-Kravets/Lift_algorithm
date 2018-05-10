//
//  PassengerProvider.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 10.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public class PassengerProvider {
    
    // MARK: -
    // MARK: Properties
    
    private var start = 1
    private var currentCountPassengerOnFloor = 1
    
    // MARK: -
    // MARK: Public
    
    public func createPassenger(numberFloorsBuilding: Int, countPassengerOnFloor: Int) -> Passenger {
        var randomBoolValue = randomBool()
        var finalNumberFloor = 0
        if randomBoolValue == true {
            if start == numberFloorsBuilding {
                randomBoolValue = false
                finalNumberFloor = randomInt(min: 1, max: self.start - 1)
            } else {
                finalNumberFloor = randomInt(min: self.start + 1, max: numberFloorsBuilding)
            }
        } else {
            if self.start == 1 {
                randomBoolValue = true
                finalNumberFloor = randomInt(min: self.start + 1, max: numberFloorsBuilding)
            } else {
                finalNumberFloor = randomInt(min: 1, max: self.start - 1)
            }
        }
        
        let passenger = Passenger(isUp: randomBoolValue, currentNumberFloor: start, finalNumberFloor: finalNumberFloor)
        
        if self.currentCountPassengerOnFloor < countPassengerOnFloor {
            self.currentCountPassengerOnFloor += 1
        } else {
            self.currentCountPassengerOnFloor = 1
            self.start += 1
        }
        
        return passenger
    }
}
