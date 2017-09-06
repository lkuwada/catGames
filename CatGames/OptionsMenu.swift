//
//  OptionsMenu.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 4/12/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import Foundation
import SpriteKit

enum GameType: Int {
    case laser
    case fish
    case mouse
}

class OptionsMenu: SKScene {
    init(size: CGSize, gameType: GameType) {
        super.init(size: size)
        
        backgroundColor = SKColor.lightGray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
