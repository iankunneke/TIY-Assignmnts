//
//  GameStartScene.swift
//  Kabobin
//
//  Created by ian kunneke on 8/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit

class GameStartScene: SKScene
{
    let playButton = SKSpriteNode(imageNamed: "PlayNowButton")
    let background = SKSpriteNode(imageNamed: "GameStartScreen")
    var fingerOnPlayNow = false
    
    override func didMoveToView(view: SKView)
    {
        self.background.anchorPoint = CGPointZero
        self.addChild(background)
        
        playButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.4)
        addChild(playButton)
        playButton.name = "PlayNow"
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node.name == "PlayNow"
        {
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .AspectFill
            
            
            self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
        }
    }

}
