//
//  ContentView.swift
//  RNGine
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI
import ModelPaints

struct iOSHomeView: View {
    @State var randomNum: String = ""
    @State var selectedDie: Dice = .coin
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
                
                PrimaryDieView(
                    selectedDie: $selectedDie,
                    randomNum: $randomNum
                )
                
                Spacer()
                
            }
            .padding()
            .adaptiveSheet(isPresented: $isSheetPresented) {
                LazyVGrid(columns: columns, spacing: 50) {
                    ForEach(Dice.allCases, id: \.self) { die in
                        PreviewDiceView(die: die)
                            .onTapGesture {
                                selectedDie = die
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
    @Binding var selectedDie: Dice
    @Binding var randomNum: String
    // Animation
    @State var shouldSpin: Bool = false
    @State var shouldShrink: Bool = false
    @State var mainDieSize: CGFloat = 200.0
    
    var body: some View {
        ZStack {
            Image(selectedDie.image)
                .resizable()
                .frame(width: mainDieSize, height: mainDieSize)
                .rotationEffect(.degrees(shouldSpin ? 360 : 0))
            
            Text("\(randomNum)")
                .font(.largeTitle)
        }
        .onTapGesture {
            
            withAnimation(.easeIn(duration: 0.3)) {
                shouldSpin.toggle()
                mainDieSize = 25
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.3)) {
                    mainDieSize = 200
                }
            }
            
            randomNum = viewModel.rng(dice: selectedDie)
        }
    }
}


struct PreviewDiceView: View {
    let die: Dice
    var body: some View {
        ZStack {
            Image(die.image)
                .resizable()
                .frame(width: 100, height: 100)
            
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
