//
//  ContentView.swift
//  RNGine Watch App
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI

struct WatchHomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var randomNum: String = "heads"
    // Animation
    @State var shouldSpin: Bool = false
    @State var shouldShrink: Bool = false
    @State var shouldShowText: Bool = true
    @State var mainDieSize: CGFloat = 120
    
    var body: some View {
        VStack {
            
            ZStack {
                Image("\(viewModel.currentDie.image)")
                    .resizable()
                    .frame(width: mainDieSize, height: mainDieSize)
                    .padding()
                    .rotationEffect( .degrees(shouldShowText ? 360 : 0))
                    .onTapGesture {
                        randomNum = viewModel.rng()
                        
                        withAnimation(.easeIn(duration: 0.5)){
                            mainDieSize = 0
                            shouldShowText.toggle()
                            shouldSpin.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                mainDieSize = 120
                                shouldShowText.toggle()
                                shouldSpin.toggle()
                            }
                        }
                    }
                
                if shouldShowText {
                    Text(randomNum)
                        .transition(.opacity)
                        .animation(.smooth, value: shouldShowText)

                }
                
            }// ZStack
        }// VStack
    }// body
}// WatchHomeView

#Preview {
    WatchHomeView()
}
