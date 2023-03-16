//
//  TransformingShapesView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/13/23.
//

import SwiftUI

struct TransformingShapesView: View {
    struct Flower: Shape {
        // How much to move this petal away from the center
        var petalOffset: Double = -20
        
        // How wide to make each petal
        var petalWidth: Double = 100
        
        func path(in rect: CGRect) -> Path {
            // The path that will hold all the petals
            var path = Path()
            
            // Count from 0 to 2pi by pi/8
            for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
                // rotate the petal by the current loop value
                let rotation = CGAffineTransform(rotationAngle: number)
                
                // move the petal to the center of the view
                let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
                
                // create a path for this petal using properties and a fixed Y and fixed height
                let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
                
                // apply the transform to the petal
                let rotatedPetal = originalPetal.applying(position)
                
                // add the petal to the main path
                path.addPath(rotatedPetal)
            }
            
            return path
        }
    }
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct TransformingShapesView_Previews: PreviewProvider {
    static var previews: some View {
        TransformingShapesView()
    }
}
