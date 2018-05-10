//
//  Lift_algorithmTests.swift
//  Lift_algorithmTests
//
//  Created by Victoria Kravets on 09.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import XCTest
@testable import Lift_algorithm

class Lift_algorithmTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreatePassenger() {
        let lift = Lift(numberFloorsBuilding: 5, countPassengerOnFloor: 2)
        lift.startProccess()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
