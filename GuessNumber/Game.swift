//
//  Game.swift
//  GuessNumber
//
//  Created by Furkan Kaynar on 7.05.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

class Game {
    var number: Int
    var tryCount = 0
    var didFinish = false
    
    init() {
        number = Int.random(in: 1 ..< 100)
    }
    
    func hit(tryNumber: Int) -> String {
        if didFinish {
            return "Congratz! Found in \(tryCount) try."
        }
        
        tryCount += 1
        if tryNumber > number {
            return "Go Lower"
        } else if tryNumber < number {
            return "Go Upper"
        } else {
            didFinish = true
            return "Congratz! Found in \(tryCount) try."
        }
    }
}
