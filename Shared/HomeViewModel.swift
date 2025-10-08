//
//  HomeViewModel.swift
//  RNGine
//
//  Created by Dom S on 9/21/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    func rng(dice: Dice) -> String {
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

enum Dice: String, CaseIterable {
    case coin
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    case d100
    
    var sides: Int {
        switch self {
        case .coin:
            0
        case .d4:
            3
        case .d6:
            4
        case .d8:
            6
        case .d10:
            6
        case .d12:
            10
        case .d20:
            6
        case .d100:
            6
        }
    }
    
    var image: String {
        switch self {
        case .coin:
            return "coin_yellow"
        case .d4:
            return "d4_green"
        case .d6:
            return "d6_turqoise"
        case .d8:
            return "d8_purple"
        case .d10:
            return "d10_pink"
        case .d12:
            return "d12_red"
        case .d20:
            return "d20_orange"
        case .d100:
            return "d10_pink"
            
        }
    }
}
