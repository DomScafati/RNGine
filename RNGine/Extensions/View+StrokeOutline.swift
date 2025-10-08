//
//  View+StrokeOutline.swift
//  RNGine
//
//  Created by Dom S on 9/28/25.
//

import SwiftUI

public extension View {
    /// Draws a uniform outline around any view (Text, images, etc.)
    /// - Parameters:
    ///   - width: outline distance in points (use abs; negative is allowed)
    ///   - color: outline color
    ///   - samples: number of copies around the circle (8–16 is typical)
    func strokeOutline(width: CGFloat, color: Color, samples: Int = 12) -> some View {
        modifier(OutlineModifier(width: abs(width), color: color, samples: max(4, samples)))
    }
}

private struct OutlineModifier: ViewModifier {
    let width: CGFloat
    let color: Color
    let samples: Int
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<samples, id: \.self) { i in
                let angle = 2 * .pi * Double(i) / Double(samples)
                content
                    .foregroundStyle(color)
                    .offset(
                        x: CGFloat(cos(angle)) * width,
                        y: CGFloat(sin(angle)) * width
                    )
            }
            
            content
        }
        .drawingGroup()
    }
}
