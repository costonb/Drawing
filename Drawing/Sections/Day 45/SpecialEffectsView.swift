//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/13/23.
//

import SwiftUI

struct SpecialEffectsView: View {
    @State private var amount = 1.0
    
    var body: some View {
        List {
            NavigationLink {
                SpecialEffectsView_ImageMultiply()
            } label: {
                VStack(alignment: .leading) {
                    Text("Multiply")
                    Text("“Multiply” is so named because it multiplies each source pixel color with the destination pixel color")
                        .font(.caption)
                }
            }
            NavigationLink {
                SpecialEffectsView_ColorScreen()
            } label: {
                VStack(alignment: .leading) {
                    Text("Screen")
                    Text("Another popular effect is called screen, which does the opposite of multiply: it inverts the colors, performs a multiply, then inverts them again, resulting in a brighter image rather than a darker image")
                        .font(.caption)
                }
            }
            NavigationLink {
                SpecialEffectsView_BlurSaturation()
            } label: {
                VStack(alignment: .leading) {
                    Text("Blur & Saturation")
                    Text("With that code, having the slider at 0 means the image is blurred and colorless, but as you move the slider to the right it gains color and becomes sharp")
                        .font(.caption)
                }
            }
        }
    }
}

struct SpecialEffectsView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsView()
    }
}

struct SpecialEffectsView_ImageMultiply: View {
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Image("Example")
                    .scaleEffect(0.3)
                
                Rectangle()
                    .fill(.red)
                    .blendMode(.multiply)
            }
            .frame(width: 300, height: 300)
            .clipped()
            
            Image("Example")
                .scaleEffect(0.3)
                .colorMultiply(.red)
                .frame(width: 300, height: 300)
                .clipped()
        }
    }
}

struct SpecialEffectsView_ColorScreen: View {
    @State private var amount = 1.0
    
    let red = Color(red: 1, green: 0, blue: 0)
    let green = Color(red: 0, green: 1, blue: 0)
    let blue = Color(red: 0, green: 0, blue: 1)
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffectsView_BlurSaturation: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 600)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
    }
}
