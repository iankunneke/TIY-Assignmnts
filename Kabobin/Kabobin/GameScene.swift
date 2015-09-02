//
//  GameScene.swift
//  Kabobin
//
//  Created by ian kunneke on 8/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//


import SpriteKit
import UIKit
import CoreMotion
import AVFoundation


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
    
    var itemsOnSkewer = 0
    let maxItemsOnSkewer = 6
    
    let kScoreHud = "scoreHud"
    var score: Int = 0
    
    var skewerCount: Int = 0
    var skewerHighCount: Int = 0
    
    let kHighScoreHud = "highScoreHud"
    var highScore: Int = 0
    
    let skewer = SKSpriteNode(imageNamed: "Skewer")
    let background = SKSpriteNode(imageNamed: "Background")
    let playArea = SKSpriteNode()
    
    var timeHud = "timeHud"
    var timeOfLastUpdate: CFTimeInterval = 0.0
    let timerTime: CFTimeInterval = 1.0
    var timeCount: Int = 21
    
    var backgroundMusicPlayer: AVAudioPlayer?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    func hideAds()
    {
        NSNotificationCenter.defaultCenter().postNotificationName("hideadsID", object: nil)
    }

    func playBackgroundMusic(filename: String)
    {
        let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
        if (url == nil)
        {
            println("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        backgroundMusicPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        if backgroundMusicPlayer == nil
        {
            println("Could not create audio player: \(error!)")
            return
        }
        else
        {
            backgroundMusicPlayer!.numberOfLoops = -1
            backgroundMusicPlayer!.prepareToPlay()
            backgroundMusicPlayer!.play()
        }
    }

    
    override func didMoveToView(view: SKView)
    {
        hideAds()
        
        backgroundColor = SKColor.whiteColor()
        self.background.anchorPoint = CGPointZero
        self.addChild(background)
        self.physicsBody?.collisionBitMask = 0
        self.physicsWorld.contactDelegate = self
        
        physicsWorld.gravity = CGVectorMake(0, -0.5)
        playArea.size = CGSizeMake(size.width, size.height)
        playArea.anchorPoint = CGPointMake(0, 0.1)
        playArea.color = UIColor.whiteColor()
        playArea.alpha = 0.6
        addChild(playArea)
        
        

        makeSkewer()
        setupHud()
        addFood()
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(addFood),SKAction.waitForDuration(0.9)])))
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(takeTimeOffTimer),SKAction.waitForDuration(1.0)])))
        


        if defaults.boolForKey("soundOff") == false
        {
            playBackgroundMusic("kabobinGameOn.mp3")
            
        }
    }

    
    
    func takeTimeOffTimer()
    {
        adjustTimeBy(-1)
    }
    
    func makeSkewer()
    {
        skewer.name = "Skewer"
        
        skewer.position = CGPoint(x: size.width * 0.5, y: size.height * 0.2)
        skewer.physicsBody = SKPhysicsBody(rectangleOfSize: skewer.size)
        skewer.physicsBody?.categoryBitMask = kSkewerCategory
        skewer.physicsBody?.contactTestBitMask = kFoodCategory
        skewer.physicsBody?.collisionBitMask = kSceneEdgeCategory
        skewer.physicsBody?.dynamic = false
        
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
        let actualX = random(min: food.size.width, max: size.width - food.size.width)

        let actualDuration = random(min: CGFloat(1.0), max: CGFloat(10))
//        let actionMove = SKAction.moveTo(CGPoint(x: actualX, y: -food.size.height/2), duration: NSTimeInterval(actualDuration))
//        let actionMoveDone = SKAction.removeFromParent()
        let spriteSpeed = random(min: CGFloat(0.5), max: CGFloat(10))
        
        
        food.physicsBody = SKPhysicsBody(rectangleOfSize: food.size)
        food.physicsBody?.affectedByGravity = true

        food.position = CGPoint(x: actualX, y: size.height - food.size.height * 2)
        food.name = foods[randomCatchIndex]
        food.physicsBody?.categoryBitMask = kFoodCategory
        food.physicsBody?.contactTestBitMask = kSkewerCategory
        food.physicsBody?.collisionBitMask = 0x0
        food.physicsBody?.dynamic = true
//        food.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
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
    
    func adjustScoreBy(points: Int)
    {
        score += points
        
        let scoreLabel = childNodeWithName(kScoreHud) as! SKLabelNode
        scoreLabel.text = String(format: "Score: %d", score)
        
        if score < 0
        {
            endGame()
        }
    }
    
    func adjustHighScoreBy(theHighScore: Int)
    {
        highScore = theHighScore
        
//        let theHighScoreLabel = childNodeWithName(kHighScoreHud) as! SKLabelNode
//        theHighScoreLabel.text = "High Score: \(highScore)"
    }
    
    func adjustSkewerCountBy(skewers: Int)
    {
        skewerCount += skewers
        
        if skewerHighCount < skewerCount
        {
            adjustHighSkewerBy(skewerCount)
        }
    }
    func adjustHighSkewerBy(theHighSkewer: Int)
    {
        skewerHighCount = theHighSkewer
    }
    
    func adjustTimeBy(gameTime: Int)
    {
        timeCount += gameTime
        
        let timeLabel = childNodeWithName(timeHud) as! SKLabelNode
        timeLabel.text = String (format: "Time: %d", timeCount)
        
        if timeCount <= 0
        {
            endGame()
        }
    }
    
    
    
    
    
    func setupHud()
    {
        let timeLabel = SKLabelNode(fontNamed: "Kailasa")
        timeLabel.name = timeHud
        timeLabel.fontSize = 30
        timeLabel.fontColor = SKColor.redColor()
        timeLabel.text = String(format:"Time: %d", timeCount)
        timeLabel.position = CGPoint(x: frame.size.width * 0.75, y: frame.size.height * 0.93)
        addChild(timeLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "Kailasa")
        scoreLabel.name = kScoreHud
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.blackColor()
        scoreLabel.text = String(format: "Score: %d", 0)
        scoreLabel.position = CGPoint(x: frame.size.width * 0.22, y: frame.size.height * 0.95)
        addChild(scoreLabel)
        
        
        let highScoreLabel = SKLabelNode(fontNamed: "Kailasa")
        highScoreLabel.name = kHighScoreHud
        highScoreLabel.fontSize = 20
        highScoreLabel.fontColor = SKColor.blackColor()
        var hs = NSUserDefaults.standardUserDefaults()
        if let previousHighScore = hs.valueForKey("myHighScore") as? Int
        {
            highScore = previousHighScore
        }
        else
        {
            highScore = 0
        }
        highScoreLabel.text = "High: \(highScore)"
        highScoreLabel.position = CGPoint(x: frame.size.width * 0.21, y: frame.size.height * 0.92)
        addChild(highScoreLabel)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact)
    {
        if contact.bodyA.node!.name == "Skewer" && contact.contactPoint.y > 270
        {
            if defaults.boolForKey("soundOff") == false
            {
            runAction(SKAction.playSoundFileNamed("kabobinContact.mp3", waitForCompletion: false))
            }
            
            contact.bodyB.node!.removeAllActions()
            
            if contact.bodyB.node!.name == "Rotten"
            {
                skewer.removeAllChildren()
                itemsOnSkewer = 0
                adjustScoreBy(-40)
            }
            
            else
            {
                itemsOnSkewer++
                if itemsOnSkewer < maxItemsOnSkewer
                {
                    var imageToAdd = contact.bodyB.node?.name
                    var nodeToAdd = SKSpriteNode(imageNamed: imageToAdd!)
                    var yPosition = CGFloat(-100)    // This is the bottom of the skewer
                    yPosition = yPosition + CGFloat(itemsOnSkewer * 40)
                    
                    nodeToAdd.position = CGPointMake(0, yPosition)
                    skewer.addChild(nodeToAdd)
                    adjustScoreBy(10)
                    
                    
                }
                else
                {
                    if defaults.boolForKey("soundOff") == false
                    {
                        runAction(SKAction.playSoundFileNamed("kabobinFill.mp3", waitForCompletion: false))
                    }
                    
                    
                    adjustScoreBy(100)
                    adjustSkewerCountBy(1)
                    adjustTimeBy(5)
                    skewer.removeAllChildren()
                    itemsOnSkewer = 0
                    
                    
                }
                

            }
            contact.bodyB.node?.removeFromParent()
    }
        
}
    
    
    

    
    
    func endGame()
    {
        if !gameEnding
        {
            
            gameEnding = true
            
            if (backgroundMusicPlayer?.playing != nil)
            {
            backgroundMusicPlayer!.stop()
            }
            
            var hs = NSUserDefaults.standardUserDefaults()
            
            
            let gameOverScene = GameOverScene(size: self.size)
            gameOverScene.scaleMode = .AspectFill
            gameOverScene.score = score
            gameOverScene.skewerCount = skewerCount
            
            println(score)
            if score > hs.valueForKey("myHighScore") as? Int
            {
                hs.setInteger(score, forKey: "myHighScore")
            }
            
            if skewerCount > hs.valueForKey("myHighSkewer") as? Int
            {
                hs.setInteger(skewerCount, forKey: "myHighSkewer")
            }

            println(highScore)
            

            view!.presentScene(gameOverScene, transition: SKTransition.doorsOpenVerticalWithDuration(1.0))
            
            
        }
    }
}


