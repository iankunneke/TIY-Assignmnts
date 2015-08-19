//
//  GameViewController.swift
//  Kabobin
//
//  Created by ian kunneke on 8/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//
import UIKit
import SpriteKit

class GameViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let scene = GameStartScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    
    
}