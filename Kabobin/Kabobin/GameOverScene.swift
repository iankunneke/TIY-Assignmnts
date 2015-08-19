//
//  GameOverScene.swift
//  Kabobin
//
//  Created by ian kunneke on 8/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene
{
    let background = SKSpriteNode(imageNamed: "Background")
    
    override func didMoveToView(view: SKView)
    {
        backgroundColor = SKColor.whiteColor()
        self.background.anchorPoint = CGPointZero
        self.addChild(background)
    }
}
