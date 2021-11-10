// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit

class LayerStack: ObservableObject, RandomAccessCollection {
    var startIndex: Int = 0
    var endIndex: Int { layers.count }

    var layers = [Layer]()

    subscript(position: Int) -> Layer { layers[position] }

    private let colors: [SKColor] = [
        .cyan, .magenta, .yellow, .red, .green
    ]

    private let initialRadiusFractions: [Double] = [
        0.95, 0.5, 0.5, 0.5, 0.5
    ]

    func addLayer(parentSKNode: SKNode) {
        let color = colors[layers.count]
        let radiusFraction = initialRadiusFractions[layers.count]

        let newLayer = Layer(
            parentSKNode: parentSKNode, color: color,
            radiusFraction: radiusFraction
        )

        layers.append(newLayer)
    }
}

class Layer: ObservableObject, Identifiable {
    let id = UUID()

    @Published var showCenters = true
    @Published var showPen = true
    @Published var showRadius = true
    @Published var showRing = true

    @Published var parentRadius: Double
    @Published var penLength = 1.0
    @Published var radiusFraction: Double

    let pen: SKShapeNode
    let penTip: SKShapeNode
    let ring: SKShapeNode

    init(parentSKNode: SKNode, color: SKColor, radiusFraction: Double) {
        let parentRadius = parentSKNode.frame.width / 2

        ring = SKShapeNode(circleOfRadius: radiusFraction * parentRadius)
        ring.strokeColor = color
        ring.fillColor = .clear
        ring.position.x += Double.random(in: 0..<50)

        parentSKNode.addChild(ring)

        pen = SKShapeNode(circleOfRadius: radiusFraction * parentRadius)
        pen.strokeColor = color
        pen.fillColor = .clear
        pen.position.x += Double.random(in: 0..<50)

        parentSKNode.addChild(pen)

        penTip = SKShapeNode(circleOfRadius: radiusFraction * parentRadius)
        penTip.strokeColor = color
        penTip.fillColor = .clear
        penTip.position.x += Double.random(in: 0..<50)

        parentSKNode.addChild(penTip)

        self.radiusFraction = radiusFraction
        self.parentRadius = parentRadius
    }
}
