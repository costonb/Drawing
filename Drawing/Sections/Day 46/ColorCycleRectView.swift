//
//  ColorCycleRectView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/15/23.
//

import SwiftUI

struct ColorCyclingRectangle: View, Animatable {
    var amount = 0.0
    var steps = 100
    var breakpoint = UnitPoint.center
    
    var animatableData: UnitPoint {
        get {
            breakpoint
        }
        
        set {
            breakpoint = newValue
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<steps, id: \.self) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    color(for: value, brightness: 0.8),
                                    color(for: value, brightness: 0.2)
                                ]), startPoint: breakpoint, endPoint: .bottom),
                        lineWidth: 1)
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

struct ColorCycleRectView: View {
    @State private var colorAmount = 0.0
    @State private var xValue = 0.0
    @State private var yValue = 0.0
    
    var breakpoint: UnitPoint {
        UnitPoint(x: xValue, y: yValue)
    }
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorAmount, breakpoint: breakpoint)
                .frame(width: 400, height: 300)
                .padding(.top, 80)
            VStack(spacing: 40) {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Color")
                    Slider(value: $colorAmount)
                }
                
                VStack(alignment: .leading) {
                    Text("Horizontal Breakpoint")
                    Slider(value: $xValue)
                }
                
                VStack(alignment: .leading) {
                    Text("Vertical Breakpoint")
                    Slider(value: $yValue)
                }
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ColorCycleRectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCycleRectView()
    }
}
