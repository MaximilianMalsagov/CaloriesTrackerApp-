//
//  GameScene.swift
//  DemoProjectCoreAnimation
//
//  Created by Maximilian on 08.12.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = .zero
        let sprite = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        self.addChild(sprite)
        
        
        let spaceship = SKSpriteNode(imageNamed: "Spaceship")
        spaceship.setScale(0.3)
        spaceship.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(spaceship)
        
        
        
        let movePoint = CGPoint(x: self.size.width, y: self.size.height)
        let moveSpaceshipAction = SKAction.move(to: movePoint, duration: 3)
//
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        let fadeOutFadeInActionSequence = SKAction.sequence([fadeOutAction,fadeInAction])
        let fadeOutFadeInActionSequenceRepeat = SKAction.repeat(fadeOutFadeInActionSequence, count: 5)
//
        
        let groupMoveActions = SKAction.group([moveSpaceshipAction,fadeOutFadeInActionSequenceRepeat])
        spaceship.run(groupMoveActions)
        
    }
}
