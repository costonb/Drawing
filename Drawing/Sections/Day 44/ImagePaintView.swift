//
//  ImagePaintView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/13/23.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        VStack {
            Text("Squirrel Border")
                .frame(width: 300, height: 300)
                .border(
                    ImagePaint(image: Image("Example"), scale: 0.2),
                    width: 70
                )
            
            Text("Squirrel Border")
                .frame(width: 300, height: 300)
                .border(
                    ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1),
                    width: 70
                )
            
            Capsule()
                .strokeBorder(
                    ImagePaint(image: Image("Example"), scale: 0.1),
                    lineWidth: 70
                )
                .frame(width: 300, height: 200)
        }
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
