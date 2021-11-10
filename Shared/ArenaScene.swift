// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit

class ArenaScene: SKScene, SKSceneDelegate, ObservableObject {
    private let ringo: SKShapeNode

    var layerStack = LayerStack()

    override init(size: CGSize) {
        ringo = SKShapeNode(circleOfRadius: 100)
        ringo.fillColor = .clear
        ringo.strokeColor = .white

        layerStack.addLayer(parentSKNode: ringo)

        super.init(size: size)

        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(ringo)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArenaScene {
    func setCarousel(spinHz: Double) {
        ringo.removeAllActions()

        if spinHz == 0 { return }

        let rotate = SKAction.rotate(byAngle: .tau, duration: 1 / spinHz)
        let rotateForever = SKAction.repeatForever(rotate)

        ringo.run(rotateForever)
    }
}

extension ArenaScene {
    func setDriveRate(hz: Double) {
        layerStack[0].ring.removeAllActions()

        if hz == 0 { return }

        let rotate = SKAction.rotate(byAngle: .tau, duration: 1 / hz)
        let rotateForever = SKAction.repeatForever(rotate)

        layerStack[0].ring.run(rotateForever)

    }
}

extension ArenaScene {
    func setViewingScale(_ scaleSquared: Double) {
        layerStack[0].ring.setScale(sqrt(scaleSquared))
    }
}
