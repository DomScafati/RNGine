//
//  WatchDiceSelectionView.swift
//  RNGine Watch App
//
//  Created by Dom S on 10/27/25.
//

import SwiftUI

struct WatchDiceSelectionView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Die.allCases, id: \.self) { die in
                    ZStack {
                        Image(die.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text(die.rawValue)
                    }
                    .padding(.bottom, 30)
                    .onTapGesture {
                        viewModel.currentDie = die
                    }
                }// ForEach
            }// LazyVGrid
        }// ScrollView
    }// body
}// SettingsView
