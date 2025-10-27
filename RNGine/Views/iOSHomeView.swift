//
//  ContentView.swift
//  RNGine
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI
import ModelPaints

struct iOSHomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var randomNum: String = ""
    @State var isSheetPresented = false
    
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ZStack {
            RNGineGradientView()
            VStack {
                
                Spacer()
                
                PrimaryDieView(randomNum: $randomNum)
                
                Spacer()
                
            }
            .padding()
            .adaptiveSheet(isPresented: $isSheetPresented) {
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(Die.allCases, id: \.self) { die in
                        DiceSelectionView(
                            die: die,
                            isSelected: viewModel.currentDie == die
                        )
                        .onTapGesture {
                            viewModel.currentDie = die
                            randomNum = ""
                        }
                    }
                }
                .padding(.top, 50)
            }
        }
    } // ZStack
}

struct PrimaryDieView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @Binding var randomNum: String
    // Animation
    @State var shouldSpin: Bool = false
    @State var shouldShrink: Bool = false
    @State var mainDieSize: CGFloat = 200.0
    @State var shouldShowText: Bool = true
    @State var isTapReady: Bool = true
    var body: some View {
        ZStack {
            Image(viewModel.currentDie.image)
                .resizable()
                .frame(width: mainDieSize, height: mainDieSize)
                .rotationEffect(.degrees(shouldSpin ? 360 : 0))
            
            if shouldShowText {
                Text("\(randomNum)")
                    .font(.largeTitle)
                    .transition(.scale)
                    .animation(.easeInOut, value: shouldShowText)
            }
        }
        .onTapGesture {
            if isTapReady {
                isTapReady.toggle()
                
                withAnimation(.easeIn(duration: 0.3)) {
                    shouldSpin.toggle()
                    shouldShowText.toggle()
                    mainDieSize = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        shouldShowText.toggle()
                        mainDieSize = 200
                    }
                    
                    randomNum = viewModel.rng()
                    isTapReady.toggle()
                }
            }
        }
    }
}


struct DiceSelectionView: View {
    let die: Die
    let isSelected: Bool
    var body: some View {
        ZStack {
            Image(die.image)
                .resizable()
                .frame(width: 100, height: 100)
                .overlay {
                    Image(die.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.bugmansGlow, radius: isSelected ? 20 : 0)
                }
            
            Text(
                "\(die.rawValue)"
            )
            .strokeOutline(width: 2.0, color: Color.abaddonBlack)
            .foregroundStyle(Color.coraxWhite)
            .padding(.top, 10)
            
            
            
        }
    }
}



#Preview {
    iOSHomeView()
        .environmentObject(HomeViewModel())
}
