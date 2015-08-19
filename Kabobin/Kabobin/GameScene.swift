//
//  GameScene.swift
//  Kabobin
//
//  Created by ian kunneke on 8/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//


import SpriteKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate
{
    let kFoodCategory: UInt32 = 0x1 << 0
    let kSkewerCategory: UInt32 = 0x1 << 1
    let kSceneEdgeCategory: UInt32 = 0x1 << 2
    
    let foods = ["Steak", "Chicken", "Shrimp", "Mushroom", "Jalepeno", "Rotten"]
    var foodCaught = 0
    
    var gameEnding: Bool = false
    
    var contactQueue: Array<SKPhysicsContact> = []
    var touchLocationX = CGFloat()
    var fingerOnSkewer = false
    
    var scoreKeeper = Score()
    let gameScore = Score()
    var scoreLabel = UILabel(frame: CGRectMake(0, 0, 100, 60))

    
    let skewer = SKSpriteNode(imageNamed: "Skewer")
    let background = SKSpriteNode(imageNamed: "Background")
    
    var timeHud = "timeHud"
    var timeout: CFTimeInterval = 20
    var timeOfLastUpdate: CFTimeInterval = 0.0
    let timePerUpdate: CFTimeInterval = 1.0
    
    
    override func didMoveToView(view: SKView)
    {
        backgroundColor = SKColor.whiteColor()
        self.background.anchorPoint = CGPointZero
        self.addChild(background)
        self.physicsBody?.collisionBitMask = 0
        self.physicsWorld.contactDelegate = self
        
        makeSkewer()
        setupHud()
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(addFood),SKAction.waitForDuration(0.9)])))
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        if currentTime - timeOfLastUpdate >= timePerUpdate
        {
            // timeout--
            // update time label
            // set time of last update to currrent time
            timeOfLastUpdate = currentTime
        }
    }
    
    func makeSkewer()
    {
        skewer.name = "Skewer"
        
        skewer.position = CGPoint(x: size.width * 0.5, y: size.height * 0.244)
        
        skewer.physicsBody = SKPhysicsBody(rectangleOfSize: skewer.size)
        skewer.physicsBody?.affectedByGravity = false
        skewer.physicsBody?.categoryBitMask = kSkewerCategory
        skewer.physicsBody?.contactTestBitMask = kFoodCategory
        skewer.physicsBody?.collisionBitMask = kSceneEdgeCategory
        
        addChild(skewer)
    }
    
    
    func random() ->CGFloat
    {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(#min: CGFloat,max: CGFloat) -> CGFloat
    {
        return random() * (max - min) + min
    }
    
    func addFood()
    {
        let randomCatchIndex = Int(arc4random_uniform(UInt32(foods.count)))
        let food = SKSpriteNode(imageNamed: foods[randomCatchIndex])
        let actualX = random(min: food.size.width/2, max: size.width - food.size.width/2)
        let actualDuration = random(min: CGFloat(1.5), max: CGFloat(8.0))
        let actionMove = SKAction.moveTo(CGPoint(x: actualX, y: -food.size.height/2), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        
        
        food.physicsBody = SKPhysicsBody(rectangleOfSize: food.size)
        food.position = CGPoint(x: actualX, y: size.height + food.size.height/2)
        
        food.physicsBody?.categoryBitMask = kFoodCategory
        food.physicsBody?.contactTestBitMask = kSkewerCategory
        food.physicsBody?.collisionBitMask = 0x0
        food.physicsBody?.dynamic = true
        food.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
        addChild(food)

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        var touch = touches.first as! UITouch
        var touchLocation = touch.locationInNode(self)
        touchLocationX = touchLocation.x
        
        fingerOnSkewer = true
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        var touch = touches.first as! UITouch
        touchLocationX = touch.locationInNode(self).x
        
        skewer.position.x = touchLocationX
        if fingerOnSkewer
        {
            var touch = touches.first as! UITouch
            var touchLocation = touch.locationInNode(self)
            var previousLocation = touch.previousLocationInNode(self)
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact)
    {
        scoreKeeper.addToScore(1)
        scoreLabel.text = String(scoreKeeper.gameScore)
        var boundY = CGFloat(0)
        var boundX = CGFloat(0)
        //boundY = 0
        
        if contact.bodyA.node!.name == "Skewer"
        {
            let boundX = skewer.physicsBody?.node?.position.x
            let fixedJoint = SKPhysicsJointFixed.jointWithBodyA(contact.bodyA.node!.physicsBody, bodyB: contact.bodyB.node!.physicsBody, anchor: CGPoint(x: boundX!, y: boundY))
            physicsWorld.addJoint(fixedJoint)

            //            contact.bodyB.node!.removeFromParent()
        }
        else
        {
            contact.bodyA!.node!.removeFromParent()
        }
        
    }
    
    func setupHud()
    {
        let timeLabel = SKLabelNode(fontNamed: "Courier")
        timeLabel.name = timeHud
        timeLabel.fontSize = 25
        timeLabel.fontColor = SKColor.redColor()
        timeLabel.text = String(format:"Time: %02u", 0)
        timeLabel.position = CGPoint(x: frame.size.width * 0.75, y: size.height - (40 + timeLabel.frame.size.height/2))
        addChild(timeLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Courier")
        
    }

}