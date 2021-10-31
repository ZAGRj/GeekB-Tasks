//
//  Apple.swift
//  SnakeGameF
//
//  Created by Julie Zagr on 23.10.2021.
//

import SpriteKit

final class Apple: SKShapeNode {
    let diameter: CGFloat = 10

    convenience init(at point: CGPoint) {
        self.init()

        path = UIBezierPath(ovalIn: CGRect(x: -diameter/2, y: -diameter/2, width: diameter, height: diameter)).cgPath
        fillColor = .systemRed
        strokeColor = UIColor.red
        lineWidth = 2
        position = point
        physicsBody = SKPhysicsBody(circleOfRadius: diameter / 2, center: .zero)
        physicsBody?.categoryBitMask = CollisionCategories.apple
    }

}

