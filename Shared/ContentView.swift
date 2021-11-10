// We are a way for the cosmos to know itself. -- C. Sagan

import SpriteKit
import SwiftUI

struct ContentView: View {
    @StateObject var arenaScene = ArenaScene(size: NSScreen.main!.frame.size)

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
