//
//  ArrowShape.swift
//  Drawing
//
//  Created by Brandon Coston on 3/15/23.
//

import SwiftUI

struct Arrow: Shape {
    var headWidth = 100.0
    var headDepth = 80.0
    var shaftWidth = 30.0
    
    var animatableData: Double {
        get {
            shaftWidth
        }
        
        set {
            shaftWidth = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX + headWidth / 2, y: rect.minY + headDepth))
        path.addLine(to: CGPoint(x: rect.midX + shaftWidth / 2, y: rect.minY + headDepth))
        path.addLine(to: CGPoint(x: rect.midX + shaftWidth / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - shaftWidth / 2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - shaftWidth / 2, y: rect.minY + headDepth))
        path.addLine(to: CGPoint(x: rect.midX - headWidth / 2, y: rect.minY + headDepth))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ArrowShape: View {
    @State private var lineWidth = 30.0
    var body: some View {
        Arrow(headWidth: 200, headDepth: 180, shaftWidth: lineWidth)
            .onTapGesture {
                withAnimation(.linear(duration: 1)) {
                    lineWidth = Double.random(in: 20...100)
                }
            }
    }
}

struct ArrowShape_Previews: PreviewProvider {
    static var previews: some View {
        ArrowShape()
    }
}
