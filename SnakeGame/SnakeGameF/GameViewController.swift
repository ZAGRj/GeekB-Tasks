//
//  GameViewController.swift
//  SnakeGameF
//
//  Created by Julie Zagr on 23.10.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setup()
    }

    private func setup() {
        guard let skView = view as? SKView else {
            return
        }

        let scene = GameScene(size: view.bounds.size)
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
    }
}

