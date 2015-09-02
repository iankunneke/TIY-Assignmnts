//
//  GameOverScene.swift
//  Kabobin
//
//  Created by ian kunneke on 8/19/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import SpriteKit
import GameKit
import AVFoundation

class GameOverScene: SKScene
{
    let background = SKSpriteNode(imageNamed: "Background")
    let playAgainButton = SKSpriteNode(imageNamed: "PlayAgain")
    let quitButton = SKSpriteNode(imageNamed: "Quit")
    var fingerOnAgain = false
    var fingerOnQuit = false
    
    var backgroundMusicPlayer: AVAudioPlayer!
    
    let kSkewerHud = "skewerHud"
    var skewerCount: Int = 0
    
    let kHighScoreHud = "highScoreHud"
    var highScore: Int = 0
    
    let kSkewerHighHud = "skewerHighHud"
    var skewerHighCount: Int = 0
    
    
    let kFinalScoreHud = "finalScoreHud"
    var score: Int = 0
    
    

    func showAds()
    {
        NSNotificationCenter.defaultCenter().postNotificationName("showadsID", object: nil)
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
        
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }

    
    
    override func didMoveToView(view: SKView)
    {
        showAds()
        
        backgroundColor = SKColor.whiteColor()
        self.background.anchorPoint = CGPointZero
        self.addChild(background)
        
        playAgainButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.7)
        addChild(playAgainButton)
        playAgainButton.name = "PlayAgain"
        
        quitButton.position = CGPoint(x: size.width * 0.5, y: size.height * 0.6)
        addChild(quitButton)
        quitButton.name = "Quit"
        
        let defaults = NSUserDefaults.standardUserDefaults()
        highScore = defaults.valueForKey("myHighScore") as! Int
        
        skewerHighCount = defaults.valueForKey("myHighSkewer") as! Int
        
        if skewerHighCount < skewerCount
        {
            adjustHighSkewerBy(skewerCount)
        }
        setUpHud()
        saveHighscore(highScore)
        if defaults.boolForKey("soundOff") == false
        {
            playBackgroundMusic("kabobinLoseGame.mp3")
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
        let touch = touches.first as! UITouch
        let location = touch.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        if node.name == "PlayAgain"
        {
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .AspectFill
            
            
            self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
        }
        
        if node.name == "Quit"
        {
            let gameScene = GameStartScene(size: self.size)
            gameScene.scaleMode = .AspectFill
            
            self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            
            
        }
    }
    
    func setUpHud()
    {
//        let loserLabel = SKLabelNode(fontNamed: "Courier")
//        loserLabel.fontSize = 35
//        loserLabel.fontColor = SKColor.grayColor()
//        loserLabel.text = "You Skewed Up!"
//        
//        loserLabel.position = CGPoint(x: frame.size.width / 2, y: size.height - (40 + loserLabel.frame.size.height/2))
//        addChild(loserLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "Kailasa")
        finalScoreLabel.name = kFinalScoreHud
        finalScoreLabel.fontSize = 30
        finalScoreLabel.fontColor = SKColor.blackColor()
        finalScoreLabel.text = "Score: \(score)"
        finalScoreLabel.position = CGPoint(x: frame.size.width * 0.23, y: frame.size.height * 0.9)
        addChild(finalScoreLabel)
        
        let skewerLabel = SKLabelNode(fontNamed: "Kailasa")
        skewerLabel.name = kSkewerHud
        skewerLabel.fontSize = 30
        skewerLabel.fontColor = SKColor.blackColor()
        skewerLabel.text = ("Skewers: \(skewerCount)")
        skewerLabel.position = CGPoint(x: frame.size.width * 0.75, y: frame.size.height * 0.9)
        addChild(skewerLabel)
        
        let highScoreLabel = SKLabelNode(fontNamed: "Kailasa")
        highScoreLabel.name = kHighScoreHud
        highScoreLabel.fontSize = 20
        highScoreLabel.fontColor = SKColor.blackColor()
        highScoreLabel.text = "High: \(highScore)"
        highScoreLabel.position = CGPoint(x: frame.size.width * 0.2, y: frame.size.height * 0.85)
        addChild(highScoreLabel)
        
        let skewerHighLabel = SKLabelNode(fontNamed: "Kailasa")
        skewerHighLabel.name = kSkewerHighHud
        skewerHighLabel.fontSize = 20
        skewerHighLabel.fontColor = SKColor.blackColor()
        skewerHighLabel.text = ("High: \(skewerHighCount)")
        skewerHighLabel.position = CGPoint(x: frame.size.width * 0.75, y: frame.size.height * 0.85)
        addChild(skewerHighLabel)
        
        
        
        
    }
    
    func adjustHighScoreBy(theHighScore: Int)
    {
        highScore = theHighScore

    }
    
    func adjustHighSkewerBy(theHighSkewer: Int)
    {
        skewerHighCount = theHighSkewer
    }
    
    
    func saveHighscore(score:Int)
    {
        
        //check if user is signed in
        if GKLocalPlayer.localPlayer().authenticated
        {
            
            var scoreReporter = GKScore(leaderboardIdentifier: "Kabobin1234") //leaderboard id here
            
            scoreReporter.value = Int64(highScore) //score variable here (same as above)
            
            var scoreArray: [GKScore] = [scoreReporter]
            
            GKScore.reportScores(scoreArray, withCompletionHandler: {(error : NSError!) -> Void in
                if error != nil
                {
                    println("error")
                }
            })
            
        }
        
    }
}
