// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit

class ArenaScene: SKScene, SKSceneDelegate, ObservableObject {
    private let ringo: SKShapeNode
    private var rings = [SKShapeNode]()

    override init(size: CGSize) {
        ringo = SKShapeNode(circleOfRadius: 100)
        ringo.fillColor = .clear
        ringo.strokeColor = .white

        let ring1 = SKShapeNode(circleOfRadius: 50)
        ring1.fillColor = .clear
        ring1.strokeColor = .white

        rings.append(ring1)

        super.init(size: size)

        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(ringo)

        ringo.addChild(ring1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArenaScene {
    func setRingoRotation(period hz: Double) {
        ringo.removeAllActions()
        let rotate = SKAction.rotate(byAngle: .tau, duration: 1 / hz)
        let rotateForever = SKAction.repeatForever(rotate)

        ringo.run(rotateForever)
    }

    func stopRingoRotation() { ringo.removeAllActions() }
}

extension ArenaScene {
    func setRing1Orbit(period hz: Double) {
        if hz == 0 { stopRing1Orbit(); return }
    }

    func stopRing1Orbit() { rings[0].removeAllActions() }
}

extension ArenaScene {
    func setViewingScale(_ scaleSquared: Double) {
        rings[0].setScale(sqrt(scaleSquared))
    }
}
