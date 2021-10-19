//
//  Game.swift
//  MiniGame
//
//  Created by Johyeon Yoon on 2021/09/27.
//

import Foundation


struct Game {
    var target = Int.random(in: 2..<100)
    var score = 0
    var round = 1
    
    
    func calculatePoints(slideValue : Int) -> Int {
        100 - abs(target - slideValue)
    }
    
    func points(slideValue: Int) -> Int {
        let difference = abs(target - slideValue)
        let bonus : Int
        
        if difference == 0 {
            bonus = 100
        }
        else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 2..<100)

    }
    
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1..<100)
    }
    
}
