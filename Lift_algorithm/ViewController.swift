//
//  ViewController.swift
//  Lift_algorithm
//
//  Created by Victoria Kravets on 09.05.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let countOfFloor = randomInt(min: 5, max: 20)
        let passengerOnFlore = randomInt(min: 1, max: 10)
        
        let lift = Lift(numberFloorsBuilding: countOfFloor, countPassengerOnFloor: passengerOnFlore)
        let result = lift.startProccess()
        
        print("You need \(result) lift Up/Down for a \(countOfFloor)-storey building with \(passengerOnFlore) people on each floor")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


