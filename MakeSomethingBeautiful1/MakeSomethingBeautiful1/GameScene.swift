//
//  GameScene.swift
//  MakeSomethingBeautiful1
//
//  Created by ian kunneke on 8/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate
{
    let kCatchCategory: UInt32 = 0x1 << 0
    let kSkewerCategory: UInt32 = 0x1 << 1
    let kSceneEdgeCategory: UInt32 = 0x1 << 2
    
    var contentCreated = false
    
    enum CatchType
    {
        case A
        case B
        case C
        case D
    }
    
    var contactQueue: Array<SKPhysicsContact> = []
    
    override func didMoveToView(view: SKView)
    {
        
    }
}