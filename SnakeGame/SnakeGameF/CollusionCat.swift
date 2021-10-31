//
//  CollusionCat.swift
//  SnakeGameF
//
//  Created by Julie Zagr on 23.10.2021.
//

import Foundation

struct CollisionCategories {
    static let snake: UInt32      = 0x1 << 0
    static let snakeHead: UInt32  = 0x1 << 1
    static let apple: UInt32      = 0x1 << 2
    static let edgeBody: UInt32   = 0x1 << 3
}
