//
//  GameOverScene.swift
//  SpriteKitGame_2_16
//
//  Created by Лаура Есаян on 13.05.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import SceneKit
import GameplayKit

class GameOverScene: SKScene {
    let gameOverLabel: SKLabelNode = SKLabelNode(text: "Game Over")
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(gameOverLabel)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        let gameScene = GameScene(size: size)
        gameScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let appearance = SKTransition.flipHorizontal(withDuration: 0.5)
        self.removeFromParent()
        view?.presentScene(gameScene, transition: appearance)
    }
}
