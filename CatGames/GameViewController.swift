//
//  GameViewController.swift
//  TestGame
//
//  Created by Lynden A. Kuwada on 4/11/17.
//  Copyright © 2017 Lynden A. Kuwada. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = view as? SKView {
            let mainMenuScene = MainMenuScene(size: view.bounds.size)
            mainMenuScene.scaleMode = .resizeFill
            
            view.ignoresSiblingOrder = true
            view.presentScene(mainMenuScene)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
