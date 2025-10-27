//
//  Dice.swift
//  RNGine
//
//  Created by Dom S on 10/27/25.
//


import Foundation
import SwiftUI

enum Die: String, CaseIterable {
    case coin
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    case d100
    
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
