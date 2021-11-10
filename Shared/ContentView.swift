// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit
import SwiftUI

struct ContentView: View {
    static private let size = CGSize(width: 800, height: 800)
    @StateObject var arenaScene = ArenaScene(size: ContentView.size)

    var body: some View {
        HStack {
            VStack {
                AppSettingsView()
                LayerSettingsListView()
            }
            .frame(width: 300)

            ArenaView()
        }
        .environmentObject(arenaScene)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
