//
//  DieSelectionView.swift
//  RNGine
//
//  Created by Dom S on 11/17/25.
//

import SwiftUI

struct DieSelectionView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 50) {
            ForEach(Die.allCases, id: \.self) { die in
                ZStack {
                    Image(die.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .overlay {
                            Image(die.image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .shadow(color: Color.bugmansGlow, radius: viewModel.currentDie == die ? 20 : 0)
                        }
                    
                    Text(
                        "\(die.rawValue)"
                    )
                    .strokeOutline(width: 2.0, color: Color.abaddonBlack)
                    .foregroundStyle(Color.coraxWhite)
                    .padding(.top, 10)
                }
                .onTapGesture {
                    viewModel.currentDie = die
                }
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    DieSelectionView()
}
