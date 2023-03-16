//
//  InsettableShapeView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/12/23.
//

import SwiftUI

struct InsettableShapeView: View {
    var body: some View {
        List {
            NavigationLink {
                InsettableShapeView_Circle()
            } label: {
                VStack(alignment: .leading) {
                    Text("Standard Shape - Circle")
                    Text("Using Stroke vs strokeBorder to have the stroke inside the shape or on the shape path")
                        .font(.caption)
                }
            }
            NavigationLink {
                InsettableShapeView_Arc()
            } label: {
                VStack(alignment: .leading) {
                    Text("Custom Insettable Shape - Arc")
                    Text("Using InsettableShape to allow a custom shape to have a strokeBorder")
                        .font(.caption)
                }
            }
        }
    }
}

struct InsettableShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InsettableShapeView()
        }
    }
}

struct InsettableShapeView_Circle: View {
    var body: some View {
        VStack(spacing: 50) {
            Circle()
                .stroke(.blue, lineWidth: 40)
            Circle()
                .strokeBorder(.blue, lineWidth: 40)
        }
    }
}

struct InsettableShapeView_Arc: View {
    struct Arc: InsettableShape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        var insetAmount = 0.0

        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment

            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

            return path
        }
        
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
    
    let code = """
    struct Arc: InsettableShape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        var insetAmount = 0.0

        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment

            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

            return path
        }
        
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
    }
        
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                .strokeBorder(.blue, lineWidth: 40)
"""
    
    var body: some View {
        ScrollView {
            VStack {
                Text(code)
                    .font(.footnote)
                Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: false)
                    .strokeBorder(.blue, lineWidth: 40)
            }
        }
    }
}
