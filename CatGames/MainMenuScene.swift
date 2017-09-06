//
//  MainMenuScene.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 4/12/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    var laserLabel = SKLabelNode()
    var fishLabel = SKLabelNode()
    var mouseLabel = SKLabelNode()
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        addButtons()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            let node = self.atPoint(position)
            
            if node == laserLabel {
                if let view = view {
                    laserLabel.fontColor = SKColor.black
                    let transition: SKTransition = SKTransition.fade(withDuration: 1.0)
                    let scene: SKScene = LaserGameScene(size: self.size)
                    //let scene:SKScene = OptionsMenu(size: self.size, gameType: GameType.laser)
                    view.presentScene(scene, transition: transition)
                }
            } else if node == fishLabel {
                if let view = view {
                    fishLabel.fontColor = SKColor.black
                    let transition: SKTransition = SKTransition.fade(withDuration: 1.0)
                    let scene: SKScene = FishPondGameScene(size: self.size)
                    view.presentScene(scene, transition: transition)
                }
            }
        }
    }
    
    private func addButtons() {
        let gameTitle = "Cat Games"
        let laserTitle = "Laser Pointer"
        let fishTitle = "Fish Pond"
        let mouseTitle = "Cat & Mouse"
        let copyrightTitle = "© Lynden Kuwada Games"
        
        let gameLabel = SKLabelNode(fontNamed: "American Typewriter")
        gameLabel.text = gameTitle
        gameLabel.fontSize = 30
        gameLabel.fontColor = SKColor.black
        gameLabel.position = CGPoint(x: frame.midX, y: size.height*0.75)
        addChild(gameLabel)
        
        laserLabel = SKLabelNode(fontNamed: "American Typewriter")
        laserLabel.text = laserTitle
        laserLabel.fontSize = 20
        laserLabel.fontColor = SKColor.darkGray
        laserLabel.position = CGPoint(x: size.width*0.5, y: size.height*0.55)
        addChild(laserLabel)
        
        fishLabel = SKLabelNode(fontNamed: "American Typewriter")
        fishLabel.text = fishTitle
        fishLabel.fontSize = 20
        fishLabel.fontColor = SKColor.darkGray
        fishLabel.position = CGPoint(x: size.width*0.5, y: size.height*0.45)
        addChild(fishLabel)
        
        mouseLabel = SKLabelNode(fontNamed: "American Typewriter")
        mouseLabel.text = mouseTitle
        mouseLabel.fontSize = 20
        mouseLabel.fontColor = SKColor.darkGray
        mouseLabel.position = CGPoint(x: size.width*0.5, y: size.height*0.35)
        addChild(mouseLabel)
        
        let copyrightLabel = SKLabelNode(fontNamed: "American Typewriter")
        copyrightLabel.text = copyrightTitle
        copyrightLabel.fontSize = 10
        copyrightLabel.fontColor = SKColor.lightGray
        copyrightLabel.position = CGPoint(x: size.width*0.5, y: size.height*0.05)
        addChild(copyrightLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
