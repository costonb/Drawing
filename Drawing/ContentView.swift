//
//  ContentView.swift
//  Drawing
//
//  Created by Brandon Coston on 3/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        CustomPathsView()
                    } label: {
                        Text("Creating custom paths with SwiftUI")
                    }
                    NavigationLink {
                        CustomShapeView()
                    } label: {
                        Text("Paths vs shapes in SwiftUI")
                    }
                    NavigationLink {
                        InsettableShapeView()
                    } label: {
                        Text("Adding strokeBorder() support with InsettableShape")
                    }
                } header: {
                    Text("Day 43")
                }
                
                Section {
                    NavigationLink {
                        TransformingShapesView()
                    } label: {
                        Text("Transforming shapes using CGAffineTransform and even-odd fills")
                    }
                    NavigationLink {
                        ImagePaintView()
                    } label: {
                        Text("Creative borders and fills using ImagePaint")
                    }
                    NavigationLink {
                        DrawingGroupView()
                    } label: {
                        Text("Enabling high-performance Metal rendering with drawingGroup()")
                    }
                } header: {
                    Text("Day 44")
                }
                
                Section {
                    NavigationLink {
                        SpecialEffectsView()
                    } label: {
                        Text("Special effects in SwiftUI: blurs, blending, and more")
                    }
                    NavigationLink {
                        SimpleAnimationView()
                    } label: {
                        Text("Animating simple shapes with animatableData")
                    }
                    NavigationLink {
                        ComplexAnimationView()
                    } label: {
                        Text("Animating complex shapes with AnimatablePair")
                    }
                    NavigationLink {
                        SpirographView()
                    } label: {
                        Text("Creating a spirograph with SwiftUI")
                    }
                } header: {
                    Text("Day 45")
                }
                
                Section {
                    NavigationLink {
                        ArrowShape()
                    } label: {
                        Text("Create an Arrow shape with an animatable shaft thickness")
                    }
                    NavigationLink {
                        ColorCycleRectView()
                    } label: {
                        Text("Create a ColorCyclingRectangle shape")
                    }
                } header: {
                    Text("Challenges")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
