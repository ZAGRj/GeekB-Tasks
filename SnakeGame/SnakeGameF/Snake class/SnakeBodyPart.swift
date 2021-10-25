//
//  SnakeBodyPart.swift
//  SnakeGameF
//
//  Created by Julie Zagr on 23.10.2021.
//

import SpriteKit

class SnakeBodyPart: SKShapeNode {

    init(at point: CGPoint, diameter: CGFloat = 13.0) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: -diameter/2, y: -diameter/2, width: diameter, height: diameter)).cgPath
        fillColor = .darkGray
        strokeColor = .systemGreen
        lineWidth = 5
        position = point

        physicsBody = SKPhysicsBody(circleOfRadius: diameter - 4, center: .zero)
        physicsBody?.isDynamic = true
        physicsBody?.categoryBitMask = CollisionCategories.snake
        physicsBody?.contactTestBitMask = CollisionCategories.edgeBody | CollisionCategories.apple
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
