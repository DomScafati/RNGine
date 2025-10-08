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
            iOSHomeView()
                .environmentObject(homeViewModel)
        }
    }
}
