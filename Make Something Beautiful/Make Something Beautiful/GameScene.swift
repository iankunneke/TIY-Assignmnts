//
//  GameScene.swift
//  Make Something Beautiful
//
//  Created by ian kunneke on 8/7/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit
import SpriteKit


class GameScene: SKScene, SKPhysicsContactDelegate
{
    var gameEnding: Bool = false
    
    var catchCaught = 0
    
    var contactQueue: Array<SKPhysicsContact> = []
    
    let skewer = SKSpriteNode(imageNamed: "Skewer")
    
    var touchLocationX = CGFloat()
    
    var isFingerOnSkewer = false
    let kSkewerCategory: UInt32 = 0x1 << 0
    let kCatchCategory: UInt32 = 0x1 << 1
    let kSceneEdgeCategory: UInt32 = 0x1 << 2
    var scoreKeeper = Score()
    
    let catches = ["BadCatch", "OrangeCatch", "StarCatch", "OceanCatch"]
    
    let gameScore = Score()
    var scoreLabel = UILabel(frame: CGRectMake(0, 0, 100, 60))
    
    
    override func didMoveToView(view: SKView)
    {
        // view setup
        backgroundColor = SKColor.whiteColor()
        
        // configure score label
        scoreKeeper.clearScore()
        self.view?.addSubview(scoreLabel)
        scoreLabel.text = "0000"
        
        // create and place the skewer on screen
        makeAndPlaceSkewer()
        
        // Physics setup for scene
        self.physicsBody?.collisionBitMask = 0
        self.physicsWorld.contactDelegate = self
        
        // Start the falling catch pieces
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(addCatch),SKAction.waitForDuration(1.0)])))
    }
    
    func makeAndPlaceSkewer()
    {
        skewer.name = "Skewer"
        
        skewer.physicsBody = SKPhysicsBody(rectangleOfSize: skewer.size)
        skewer.physicsBody?.affectedByGravity = false
        
        skewer.position = CGPoint(x: size.width * 0.5, y: size.height * 0.0)
        skewer.physicsBody?.categoryBitMask = kSkewerCategory
        skewer.physicsBody?.contactTestBitMask = kCatchCategory
        skewer.physicsBody?.collisionBitMask = kSceneEdgeCategory
        
        addChild(skewer)
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        var touch = touches.first as! UITouch
        var touchLocation = touch.locationInNode(self)
        touchLocationX = touchLocation.x
        //let touchLocationX = touch.locationInNode(self).x
        
//        println(touchLocation)
        isFingerOnSkewer = true
//        
//        if let body = physicsWorld.bodyAtPoint(touchLocation)
//        {
//            if body.node!.name == "Skewer"
//            {
//                println("Began touch on skewer")
//                isFingerOnSkewer = true
//            }
//        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        var touch = touches.first as! UITouch
        touchLocationX = touch.locationInNode(self).x
        // reposition the x coordinate for the skewer
        
        skewer.position.x = touchLocationX
        
        //touchLocationX = touchLocation.x
//        println(touchLocationX)
        if isFingerOnSkewer
        {
            //SKAction.moveToX(scewer: touchLocationX, 0)
            //SKAction.movetoX(touchLocationX, 0)
            var touch = touches.first as! UITouch
            var touchLocation = touch.locationInNode(self)
            var previousLocation = touch.previousLocationInNode(self)
            //var aScewer = childNodeWithName("skewer") as! SKSpriteNode
//            skewer = aSkewer.position.x + (touchLocation.x - previousLocation.x)
//
//            scewerX = max(scewerX, aScewer.size.width/2)
//            scewerX = min(scewerX, size.width - aScewer.size.width/2)
//            aScewer.position = CGPointMake(scewerX, aScewer.position.y)
        }
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        //intentional no-op
    }
    
    

    
    func didBeginContact(contact: SKPhysicsContact)
    {
        scoreKeeper.addToScore(1)
        scoreLabel.text = String(scoreKeeper.gameScore)
//        println("collision detected")
        if contact.bodyA.node!.name == "Skewer"
        {
            contact.bodyB.node!.removeFromParent()
        }
        else
        {
            contact.bodyA!.node!.removeFromParent()
        }
        
    }
    
    func random() ->CGFloat
    {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(#min: CGFloat,max: CGFloat) -> CGFloat
    {
        return random() * (max - min) + min
    }
    
    func addCatch()
    {
        let randomCatchIndex = Int(arc4random_uniform(UInt32(catches.count)))
        let catch = SKSpriteNode(imageNamed: catches[randomCatchIndex])
        //catch.name = catches[randomCatchIndex]
        let actualX = random(min: catch.size.width/2, max: size.width - catch.size.width/2)
//        println("random x for shape: \(actualX)")
        
        catch.physicsBody = SKPhysicsBody(rectangleOfSize: catch.size)
        catch.position = CGPoint(x: actualX, y: size.height + catch.size.height/2)
        addChild(catch)
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(6.0))
        
        let actionMove = SKAction.moveTo(CGPoint(x: actualX, y: -catch.size.width/2), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        //catch.physicsBody = SKPhysicsBody(rectangleOfSize: catch.size)
        catch.physicsBody?.categoryBitMask = kCatchCategory
        catch.physicsBody?.contactTestBitMask = kSkewerCategory
        catch.physicsBody?.collisionBitMask = 0x0
        //catch.physicsBody?.usesPreciseCollisionDetection = true
        catch.physicsBody?.dynamic = true
        catch.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
//    func endGame()
//    {
//        if !gameEnding
//        {
//            gameEnding = true
//            
//        }
//    }
    
//    func catchDidCollideWithSkewer(skewer:SKSpriteNode, catch:SKSpriteNode)
//    {
//        println("Hit")
//        catch.removeFromParent()
//        
//        catchCaught++
//       
//        
//    }
    


}
