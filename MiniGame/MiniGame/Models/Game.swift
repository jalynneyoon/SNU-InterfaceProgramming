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
}
