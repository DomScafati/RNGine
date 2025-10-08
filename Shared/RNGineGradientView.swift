//
//  RNGineGradientView.swift
//  RNGine
//
//  Created by Dom S on 9/28/25.
//

import SwiftUI
import ModelPaints

struct RNGineGradientView: View {
    let primary: Color = .xereusPurple
    let secondary: Color = .pinkHorror
    
    var body: some View {
        let stops = [
            Gradient.Stop(color: primary, location: 0.2),
            Gradient.Stop(color: secondary, location: 0.5),
            Gradient.Stop(color: primary, location: 0.9),
        ]
        
        AngularGradient(stops: stops, center: .center)
            .ignoresSafeArea()
        
    }
}
