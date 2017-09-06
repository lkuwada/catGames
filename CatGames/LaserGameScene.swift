//
//  LaserGameScene.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 6/27/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import SpriteKit
import GameplayKit

class LaserGameScene: GameScene {
    let dot = SKSpriteNode(imageNamed: "redDot")
    var randomTimeDuration:CGFloat = 0.0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        dot.name = "dot"
        dot.position = CGPoint(x: 0, y: 0)
        addChild(dot)
        
        NSLog("self.frame \(self.frame)")
        if let vf = self.view?.frame {
            NSLog("self.view.frame \(vf)")
        }
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(moveDotStraight),
                SKAction.wait(forDuration: TimeInterval(randomTimeDuration)),
                SKAction.run(unsteadyPausedDot),
                SKAction.wait(forDuration: 1.0),
                SKAction.run(moveDotSquiggle),
                SKAction.run(unsteadyPausedDot),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {
            return
        }
        let touchPosition = touch.location(in: self)
        let touchedNode = atPoint(touchPosition)
        if touchedNode.name == dot.name {
            feedbackGenerator.impactOccurred()
            NSLog("touchPosition \(touchPosition)")
            if let vf = self.view?.frame {
                let randPos = randomPoint(bounds: vf)
                NSLog("randPos \(randPos)")
                dot.position = randPos
                NSLog("dot.position \(dot.position)")
            }
        }
    }
    
    func addDot() {
        NSLog("dot added")
        dot.name = "dot"
        let randomPos = randomPoint(bounds: self.frame)
        NSLog("randomPos = \(randomPos)")
        dot.position = randomPos
        addChild(dot)
    }
    
    func unsteadyPausedDot() {
        let oval = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 5.0, height: 5.0))
        let path = SKAction.follow(oval.cgPath, speed: 90.0)
        //        let ovalPath = SKAction.follow(oval.cgPath, duration: TimeInterval(randomDuration(min: 1.0, max: 2.0)))
        dot.run(SKAction.repeat(path, count: 5))
    }
    
    func moveDotStraight() {
        randomTimeDuration = randomDuration(min: 0.1, max: 1.5)
        let moveAction = SKAction.move(to: randomPoint(bounds: self.frame), duration: TimeInterval(randomTimeDuration))
        dot.run(moveAction)
    }
    
    func moveDotSquiggle() {
        let rDuration = randomDuration(min: 0.1, max: 1.5)
        //        let moveAction = SKAction.move(to: randomPoint(bounds: self.frame), duration: 2.0)
        let moveAction = SKAction.move(to: randomPoint(bounds: self.frame), duration: TimeInterval(rDuration))
        let waitAction = SKAction.wait(forDuration: TimeInterval(rDuration))
        dot.run(SKAction.sequence([moveAction, waitAction]))
        //        dot.run(moveAction)
        //        dot.run(SKAction.wait(forDuration: TimeInterval(rDuration)))
    }
}
