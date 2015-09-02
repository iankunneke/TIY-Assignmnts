//
//  GameScene.swift
//  MakeSomethingBeautiful1
//
//  Created by ian kunneke on 8/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit
import CoreMotion
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate
{
    let kCatchCategory: UInt32 = 0x1 << 0
    let kSkewerCategory: UInt32 = 0x1 << 1
    let kSceneEdgeCategory: UInt32 = 0x1 << 2
    
    let food = ["Steak", "Chicken", "Shrimp", "Mushroom", "Jalepeno", "Rotten"]
    var foodCaught = 0
    
    var gameEnding: Bool = false
    
    var contactQueue: Array<SKPhysicsContact> = []
    var touchLocationX = CGFloat()
    var isFingerOnSkewer = false
    
    var scoreKeeper = Score()
    let gameScore = Score()
    var scoreLabel = UILabel(frame: CGRectMake(0, 0, 100, 60))
    
    let skewer = SKSpriteNode(imageNamed: "Skewer")
    let background = SKSpriteNode(imageNamed: "Background")
    
    
    override func didMoveToView(view: SKView)
    {
        self.view?.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
}