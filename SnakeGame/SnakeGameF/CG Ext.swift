//
//  CG Ext.swift
//  SnakeGameF
//
//  Created by Julie Zagr on 23.10.2021.
//

import UIKit

extension CGPoint {

    func relative(to frame: CGRect) -> CGPoint {
        return CGPoint(x: frame.origin.x + x, y: frame.origin.y + y)
    }
}
