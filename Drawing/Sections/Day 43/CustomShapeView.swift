//
//  CustomShapeView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/12/23.
//

import SwiftUI

struct CustomShapeView: View {
    var body: some View {
        List {
            NavigationLink {
                CustomShapeView_Triangle()
            } label: {
                VStack(alignment: .leading) {
                    Text("Custom Shape - Triangle")
                    Text("We could wrap that path in a shape to make sure it automatically takes up all the space available")
                        .font(.caption)
                }
            }
            NavigationLink {
                CustomShapeView_Arc()
            } label: {
                VStack(alignment: .leading) {
                    Text("Custom Shape - Arc")
                    Text("Angles and rotation are not what expected, so need to adjust arc to account for angle and direction ")
                        .font(.caption)
                }
            }
        }
    }
}

struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomShapeView()
        }
    }
}

struct CustomShapeView_Triangle: View {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
            return path
        }
    }
    let code = """
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        return path
    }
}
        
            Triangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
"""
    var body: some View {
        VStack {
            Triangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)
            Spacer()
            Text(code)
                .font(.footnote)
        }
    }
}

struct CustomShapeView_Arc: View {
    struct Arc: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        
        func path(in rect: CGRect) -> Path {
            let rotationAjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAjustment
            let modifiedEnd = endAngle - rotationAjustment
            return Path { path in
                path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            }
        }
    }
    
    let code = """

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAjustment
        let modifiedEnd = endAngle - rotationAjustment
        return Path { path in
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        }
    }
}

            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
"""
    
    var body: some View {
        VStack {
            Spacer()
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            Spacer()
            Text(code)
                .font(.footnote)
        }
    }
}
