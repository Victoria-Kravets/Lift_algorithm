//
//  Lift.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 09.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public class Lift {
    
    // MARK: -
    // MARK: Properties
    
    let numberFloorsBuilding: Int
    let countPassengerOnFloor: Int
    var start = 1

    var currentLiftFloor = 1
    var isUP = true
    var min = 0
    var max = 0
    var step = 1
    var countOfLiftUpDown = 0
    var passengers = [Passenger]()
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(numberFloorsBuilding: Int, countPassengerOnFloor: Int) {
        self.numberFloorsBuilding = numberFloorsBuilding
        self.countPassengerOnFloor = countPassengerOnFloor
    }
    
    // MARK: -
    // MARK: Public
    
    public func startProccess() -> Int {
        
        let count = countPassengerOnFloor * numberFloorsBuilding
        for _ in 1...count {
            let passenger = PassengerProvider()
                .createPassenger(numberFloorsBuilding: self.numberFloorsBuilding, countPassengerOnFloor: self.countPassengerOnFloor)
            self.passengers.append(passenger)
        }
        
        var liftArray = [Passenger]()
        self.start = 1
        
        if self.isUP == true && self.countOfLiftUpDown == 0 {
            self.min = 1
            self.max = numberFloorsBuilding + 1
        }
        
        while self.passengers.count != 0 {
            for floor in stride(from: self.min, to: self.max, by: step) {
                if (self.start == 1 && self.isUP == true && self.countOfLiftUpDown == 0 && liftArray.count == 0) {
                    self.min = 1
                    self.max = 2
                }
                
                for passengerInLift in liftArray {
                    if passengerInLift.finalNumberFloor == floor {
                        liftArray.remove(object: passengerInLift)
                        self.start = floor
                    }
                }
                
                if (floor < self.max && self.isUP == true) || (floor > self.max && self.isUP == false) {
                    for passenger in  self.passengers {
                        if liftArray.count < 5 {
                            if passenger.currentNumberFloor == floor && passenger.isUp == self.isUP {
                                
                                if (self.isUP == true && passenger.finalNumberFloor >  self.max) ||
                                    (self.isUP == false && passenger.finalNumberFloor <  self.max) {
                                    self.max = passenger.finalNumberFloor
                                }
                                
                                liftArray.append(passenger)
                                self.passengers.remove(object: passenger)
                            }
                        }
                    }
                }
            }
            
            self.countOfLiftUpDown += 1
            
            if liftArray.count == 0 && self.isUP == true {
                self.reverseArray(self.passengers)
                for passenger in  self.passengers {
                    if passenger.currentNumberFloor == self.max {
                        if passenger.isUp == true {
                            self.configureValues(isUP: true, start: self.max, min: self.start, max: self.numberFloorsBuilding+1, step: 1)
                            self.reverseArray(self.passengers)
                            break
                        } else {
                            self.configureValues(isUP: false, start: self.max, min: self.start, max: 0, step: -1)
                            break
                        }
                    }
                    
                    if self.isUP == true {
                        for passenger in  self.passengers {
                            if passenger.isUp == true {
                                self.configureValues(isUP: true, start: self.max, min: 1, max: self.numberFloorsBuilding+1, step: 1)
                                self.reverseArray(self.passengers)
                                break
                            } else {
                                self.configureValues(isUP: false, start: self.max, min: self.start, max: 0, step: -1)
                                break
                            }
                        }
                    }
                }
                
            } else if liftArray.count == 0 && self.isUP == false {
                
                for passenger in  self.passengers {
                    if passenger.isUp == true {
                        if passenger.currentNumberFloor == self.max {
                            self.configureValues(isUP: true, start: self.max, min: self.start, max: self.numberFloorsBuilding+1, step: 1)
                            break
                        } else {
                            self.configureValues(isUP: true, start: self.numberFloorsBuilding+1, min: self.start, max: self.numberFloorsBuilding+1, step: -1)
                        }
                    }
                }
                
                if self.isUP == false {
                    self.isUP = false
                    self.start = self.max
                    if max == 0 {
                        self.configureValues(isUP: false, start: self.max, min: self.numberFloorsBuilding, max: 0, step: -1)
                    } else {
                        self.configureValues(isUP: false, start: self.max, min: self.start, max: 0, step: -1)
                    }
                }
            }
        }

        return self.countOfLiftUpDown
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureValues(isUP: Bool, start: Int, min: Int, max: Int, step: Int) {
        self.isUP = isUP
        self.start = start
        self.max = max
        self.min = min
        self.step = step
    }
    
    private func reverseArray(_ array: [Passenger]) {
        let reversedPassengers = Array(array.reversed())
        self.passengers.removeAll()
        self.passengers = reversedPassengers
    }
}





