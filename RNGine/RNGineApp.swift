//
//  RNGineApp.swift
//  RNGine
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI

@main
struct RNGineApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Home", systemImage: "house") {
                    iOSHomeView()
                }
                
                Tab("Select", systemImage: "dice") {
                    DieSelectionView()
                }
                
                Tab("History", systemImage: "scroll") {
                    RollHistoryView()
                }
            }
            .environmentObject(homeViewModel)
            
            
        }
    }
}
