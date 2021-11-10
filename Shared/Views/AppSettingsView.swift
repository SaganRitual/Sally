// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AppSettingsView: View {
    @EnvironmentObject var arenaScene: ArenaScene

    @State var ring0SpinPeriod = 0.0
    @State var ring1OrbitalPeriod = 1.0
    @State var simulationSpeed = 1.0
    @State var zoomLevel = 1.0

    static let pathFadeDurationSeconds = CGFloat(5)

    var body: some View {
        VStack {
            HStack {
                SettingsSliderView(
                    label: "Ring0 spin", range: -2...2,
                    value: $ring0SpinPeriod
                )
                .padding(.trailing, 10)
                .onChange(of: ring0SpinPeriod) { arenaScene.setRingoRotation(period: $0) }

                Text("\(ring0SpinPeriod.asString(decimals: 2)) Hz")
                    .padding(.trailing, 10)
            }

            HStack {
                SettingsSliderView(
                    label: "Ring1 orbit", range: -2...2,
                    value: $ring1OrbitalPeriod
                )
                .padding(.trailing, 10)
                .onChange(of: ring1OrbitalPeriod) { arenaScene.setRing1Orbit(period: $0) }

                Text("\(ring1OrbitalPeriod.asString(decimals: 2)) Hz")
                    .padding(.trailing, 10)
            }

            HStack {
                SettingsSliderView(
                    label: "Speed", range: 0...10,
                    value: $simulationSpeed
                )
//                .padding(.trailing, 10)
//                .onChange(of: simulationSpeed) { arenaScene.speed = simulationSpeed }

                Text("\(simulationSpeed.asString(decimals: 2))")
                    .padding(.trailing, 10)
            }

            HStack {
                SettingsSliderView(label: "Zoom", range: 0.1...10, value: $zoomLevel)
                    .padding(.trailing, 10)
                    .onChange(of: zoomLevel) { newValue in
                        arenaScene.setViewingScale(zoomLevel)
                    }

                Text("\(zoomLevel.asString(decimals: 2))")
                    .padding(.trailing, 10)
            }
        }
    }
}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppSettingsView()
//    }
//}
