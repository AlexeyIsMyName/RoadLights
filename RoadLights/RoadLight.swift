//
//  RoadLight.swift
//  RoadLights
//
//  Created by ALEKSEY SUSLOV on 26.03.2021.
//

import SwiftUI

struct RoadLight: View {
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                ColorCircle(color: lights[.red]!.rawColor)
                ColorCircle(color: lights[.yellow]!.rawColor)
                ColorCircle(color: lights[.green]!.rawColor)
                Spacer()
                Button(action: buttonPressed, label: {
                    Text(textButton)
                        .font(.title)
                })
            }
            .padding()
        }
    }
    
    @State private var textButton = "Start"
    @State private var currentLightColor: Lights = .none
    @State private var lights: [Lights: Light] = [
        .red: Light(color: .red, isOn: false),
        .yellow: Light(color: .yellow, isOn: false),
        .green: Light(color: .green, isOn: false)
    ]
    
    private func buttonPressed() {
        changeLight()
        textButton = "Next"
    }
    
    private func changeLight() {
        switch currentLightColor {
        case .red: currentLightColor = .yellow
        case .yellow: currentLightColor = .green
        case .green: currentLightColor = .red
        case .none: currentLightColor = .red
        }
    
        setLights()
    }
    
    private func setLights() {
        for key in lights.keys {
            if lights[key]?.color == currentLightColor {
                lights[key]?.isOn = true
            } else {
                lights[key]?.isOn = false
            }
        }
    }
}

enum Lights {
    case red
    case yellow
    case green
    case none
}

struct Light {

    let color: Lights
    var isOn: Bool
    
    var rawColor: Color {
        switch color {
        case .red: return isOn ? Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))
        case .yellow: return isOn ? Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1))
        case .green: return isOn ? Color(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)) : Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
        case .none: return .white
        }
    }
}

struct RoadLight_Previews: PreviewProvider {
    static var previews: some View {
        RoadLight()
    }
}
