//
//  Score.swift
//  Make Something Beautiful
//
//  Created by ian kunneke on 8/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Score
{
    var gameScore: Int = 0
    
    
    func addToScore(points: Int)
    {
        gameScore = gameScore + points
    }
    func clearScore()
    {
        gameScore = 0
    }
}

