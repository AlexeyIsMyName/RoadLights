//
//  ColorCircle.swift
//  RoadLights
//
//  Created by ALEKSEY SUSLOV on 26.03.2021.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.gray, lineWidth: 5))
            .shadow(color: .white, radius: 5)
            .padding()
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red)
    }
}
