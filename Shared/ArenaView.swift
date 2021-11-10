// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit
import SwiftUI

class ArenaScenePlusDelegate: SKScene, SKSceneDelegate {
    let ringo: SKShapeNode

    override init() {
        ringo = SKShapeNode(circleOfRadius: 100)
        ringo.lineWidth = 5
        ringo.fillColor = .clear
        ringo.strokeColor = .white
        ringo.zPosition = 5

        super.init()
        self.addChild(ringo)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct ArenaView: View {
    @State var arenaScene = ArenaScenePlusDelegate()

    var body: some View {
        SpriteView(scene: arenaScene)
            .padding()
            .ignoresSafeArea()
    }
}

struct ArenaView_Previews: PreviewProvider {
    static let ringo = SKShapeNode(circleOfRadius: 100)

    static var previews: some View {
        ArenaView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
