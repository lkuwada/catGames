//
//  GameScene.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 4/11/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let swipeRight = UISwipeGestureRecognizer()
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        
        // swipe gesture
        swipeRight.addTarget(self, action: #selector(GameScene.swipedRight))
        swipeRight.direction = .right
        swipeRight.numberOfTouchesRequired = 2
        self.view?.addGestureRecognizer(swipeRight)
    }
    
    func swipedRight() {
        if let view = view {
            let transition: SKTransition = SKTransition.reveal(with: .right, duration: 0.5)
            let scene: SKScene = MainMenuScene(size: self.size)
            view.presentScene(scene, transition: transition)

        }
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func randomDuration(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func randomPoint (bounds: CGRect) -> CGPoint {
        return CGPoint(x: Int(UInt32(bounds.minX) + arc4random_uniform(UInt32(bounds.width))), y: Int(UInt32(bounds.minY) + arc4random_uniform(UInt32(bounds.height))))
    }
}
