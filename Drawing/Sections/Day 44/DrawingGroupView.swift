//
//  DrawingGroupView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/13/23.
//

import SwiftUI

struct ColorCyclingCircle: View, Animatable {
    var amount = 0.0
    var steps = 150
    
    var animatableData: Double {
        get { amount }
        set { amount = newValue }
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        RadialGradient(colors: [
                            color(for: value, brightness: 3.0),
                            color(for: value, brightness: 0.0)
                        ],
                                       center: .top,
                                       startRadius: 0,
                                       endRadius: 400),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        while targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct DrawingGroupView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 400, height: 400)
                .animation(.linear(duration: 1.5).repeatForever(autoreverses: true), value: colorCycle)
                .onAppear {
                    colorCycle = 1.0
                }
        }
    }
}

struct DrawingGroupView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroupView()
    }
}
