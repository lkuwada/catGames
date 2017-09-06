//
//  FishPondGameScene.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 6/27/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import SpriteKit
import GameplayKit

class FishPondGameScene: GameScene {
    let pondColor: UIColor = UIColor(red: 68.0/255.0, green: 149.0/255.0, blue: 196.0/255.0, alpha: 1.0)
    let rippleColor: UIColor = UIColor(red: 129.0/255.0, green: 210.0/255.0, blue: 232.0/255.0, alpha: 0.6)
    let initialRippleRadius: CGFloat = 15.0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = pondColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchPosition = touch.location(in: self)
        let rippleScale = randomDuration(min: 4.0, max: 8.0)
        
        run(SKAction.repeat(SKAction.sequence([
            SKAction.run {
                self.rippleEffect(location: touchPosition, scale: rippleScale, duration: TimeInterval(1.0))
            },
            SKAction.wait(forDuration: 0.2)
            ]), count: 3))
        
    }
    
    func rippleEffect(location: CGPoint, scale: CGFloat, duration: TimeInterval) {
        let circle = CircleNode(radius: initialRippleRadius, position: location)
        circle.glowWidth = 5.0
        circle.strokeColor = rippleColor
        circle.fillColor = SKColor.clear
        self.addChild(circle)
        
        let startRadius = initialRippleRadius
        let endRadius = startRadius * scale
        
        let scaleAction = SKAction.customAction(withDuration: duration, actionBlock: { node, elapsedTime in
            if let node = node as? CircleNode {
                let fraction = elapsedTime / CGFloat(duration)
                node.radius = startRadius + (fraction * endRadius)
            }
        })
        let fadeAction = SKAction.fadeAlpha(to: 0.0, duration: duration)
        fadeAction.timingMode = SKActionTimingMode.easeOut
        let actionGroup = SKAction.group([scaleAction, fadeAction])
        
        circle.run(actionGroup, completion: {
            circle.removeFromParent()
        })
    }
}
