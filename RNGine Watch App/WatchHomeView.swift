//
//  ContentView.swift
//  RNGine Watch App
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI

struct WatchHomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var selectedDie: Dice = .coin
    @State var randomNum: String = ""
    
    var body: some View {
        VStack {
            
            ZStack {
                Image("\(selectedDie.image)")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        randomNum = viewModel.rng(dice: selectedDie)
                    }
                
                Text(randomNum)

            }
            .padding()
        }
    }
}

#Preview {
    WatchHomeView()
}
