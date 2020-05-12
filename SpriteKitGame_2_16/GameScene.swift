//
//  GameScene.swift
//  SpriteKitGame_2_16
//
//  Created by Лаура Есаян on 12.05.2020.
//  Copyright © 2020 LY. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var player: SKShapeNode! = nil
    var enemy: SKShapeNode! = nil
    var scoreLabel: SKLabelNode! = nil

    var counter = 0
    
    override func didMove(to view: SKView) {
        let radius = view.frame.width / 12
        player = initializeNode(with: radius, color: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        enemy = initializeNode(with: radius, color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), position: CGPoint(x: 0, y: view.frame.height / 4))
        scoreLabel = createLabelNode(text: "Score: 0", position: CGPoint(x: view.frame.width / 2, y: view.frame.height / 2))
        
        self.addChild(player)
        self.addChild(enemy)
        self.addChild(scoreLabel)
        
        moveEnemy()
        increaseEnemySize()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        move(node: player, to: (touches.first?.location(in: self))!, completion: nil)
    }
    
    func createLabelNode(text: String, position: CGPoint) -> SKLabelNode {
        let labelNode = SKLabelNode(text: text)
        labelNode.fontColor = #colorLiteral(red: 0.9686274529, green: 0.8910074234, blue: 0.03772118949, alpha: 1)
        labelNode.position = CGPoint(x: position.x - labelNode.frame.width, y: position.y - labelNode.frame.height)
        return labelNode
    }
    
    func initializeNode(with radius: CGFloat, color: UIColor, position: CGPoint? = nil) -> SKShapeNode {
        let node = SKShapeNode(circleOfRadius: radius)
        node.fillColor = color
        node.lineWidth = 0
        node.position = position ?? CGPoint(x: 0, y: 0)
        
        return node
    }
    
    func move(node: SKNode, to position: CGPoint, completion: (() -> Void)? = nil) {
        let move = SKAction.move(to: position, duration: 1.0)
        node.run(move, completion: completion ?? {})
    }
    
    func moveEnemy() {
        move(node: enemy, to: player.position, completion: moveEnemy)
        counter += 1
        scoreLabel.text = "Score: \(counter)"
        
    }
    
    func increaseEnemySize() {
        enemy.xScale += 0.1
        enemy.yScale += 0.1
        let waitAction = SKAction.wait(forDuration: 5.0)
        counter += 1
        scoreLabel.text = "Score: \(counter)"
        enemy.run(waitAction, completion: increaseEnemySize)
    }
}
