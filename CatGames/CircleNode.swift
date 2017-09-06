//
//  CircleNode.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 8/31/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import Foundation
import SpriteKit

class CircleNode: SKShapeNode {
    var radius: CGFloat {
        didSet {
            self.path = CircleNode.path(radius: self.radius)
        }
    }
    
    init(radius: CGFloat, position: CGPoint) {
        self.radius = radius
        super.init()
        self.path = CircleNode.path(radius: self.radius)
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func path(radius: CGFloat) -> CGMutablePath {
        let path: CGMutablePath = CGMutablePath()
        path.addArc(center: CGPoint(x: 0.0, y: 0.0), radius: radius, startAngle: 0.0, endAngle: CGFloat(2.0 * .pi), clockwise: true)
        return path
    }
}
