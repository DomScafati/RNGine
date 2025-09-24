//
//  ContentView.swift
//  RNGine
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI
import ModelPaints

struct ContentView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var randomNum: String = ""
    @State var selectedDie: Dice = .coin
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack {
                Image(selectedDie.image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        randomNum = viewModel.rng(dice: selectedDie)
                    }
                
                Text("\(randomNum)")
                    .font(.largeTitle)
            }
            
            Spacer()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(Dice.allCases, id: \.self) { die in
                    ZStack {
                        Image(die.image)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .onTapGesture {
                                selectedDie = die
                                randomNum = ""
                            }
                    }
                    
                }
            }
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
