//
//  RNGineApp.swift
//  RNGine Watch App
//
//  Created by Dom S on 9/17/25.
//

import SwiftUI

@main
struct RNGine_Watch_AppApp: App {
    @State var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            WatchHomeView()
        }
        .environmentObject(viewModel)
    }
}
