// We are a way for the cosmos to know itself. -- C. Sagan

import SwiftUI

struct AppSettingsView: View {
    @EnvironmentObject var arenaScene: ArenaScene

    @State var driveRateHz = 1.0
    @State var simulationSpeed = 1.0
    @State var zoomLevel = 1.0

    @State var carouselSpinHz = 0.0

    static let pathFadeDurationSeconds = CGFloat(5)

    var body: some View {
        VStack {
            HStack {
                SettingsSliderView(
                    label: "Carousel", range: -2...2,
                    value: $carouselSpinHz
                )
                .padding(.trailing, 10)
                .onChange(of: carouselSpinHz) { arenaScene.setCarousel(spinHz: $0) }

                Text("\(carouselSpinHz.asString(decimals: 2)) Hz")
                    .padding(.trailing, 10)
            }

            HStack {
                SettingsSliderView(
                    label: "Drive rate", range: -2...2,
                    value: $driveRateHz
                )
                .padding(.trailing, 10)
                .onChange(of: driveRateHz) { arenaScene.setDriveRate(hz: $0) }

                Text("\(driveRateHz.asString(decimals: 2)) Hz")
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
