//
//  HomeViewModel.swift
//  RNGine
//
//  Created by Dom S on 9/21/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    func rng(dice: Die) -> String {
        let rangeLower: Int = 1
        var rangeUpper: Int
        var randomNum: Int
        var result: String
        
        switch dice {
        case .coin:
            rangeUpper = 2
        case .d4:
            rangeUpper = 4
        case .d6:
            rangeUpper = 6
        case .d8:
            rangeUpper = 8
        case .d10:
            rangeUpper = 10
        case .d12:
            rangeUpper = 12
        case .d20:
            rangeUpper = 20
        case .d100:
            rangeUpper = 100
        }
        
        randomNum = Int.random(in: rangeLower...rangeUpper)
        if dice == .coin {
            if randomNum % 2 == 0 {
                result = "Tails"
            } else {
                result = "Heads"
            }
        } else {
            result = String(randomNum)
        }
        
        return result
    }

}
