//
//  HomeViewModel.swift
//  RNGine
//
//  Created by Dom S on 9/21/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentDie: Die
    private let rollHistory: RollHistoryProtocol
    
    init(
        currentDie: Die = .coin,
        rollHistory: RollHistoryProtocol = RollHistory()
    ) {
        self.currentDie = currentDie
        self.rollHistory = rollHistory
    }
    
    
    
    /// A function that adds the user's most recent roll to a store of all rolls. It converts the string value into an Int. In the case of a coin, 0 = heads, 1 = tails.
    /// -roll: the string value of the roll
    func addRollHistory(_ roll: String)  {
        var finalValue: Int
        
        if currentDie == .coin {
            if roll.lowercased() == "heads" {
                finalValue = 0
            } else {
                finalValue = 1
            }
        } else {
            guard let roll = Int(roll) else { return }
            finalValue = roll
        }
        
        let rollRecord = RollRecord(
            value: finalValue,
            date: Date()
        )
        
        Task {
            await self.rollHistory.add(
                rollRecord,
                at: self.currentDie
            )
            
            print(rollHistory)
        }
    }
    
    func rng() -> String {
        let rangeLower: Int = 1
        var rangeUpper: Int
        var randomNum: Int
        var result: String
        
        switch self.currentDie {
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
        if self.currentDie == .coin {
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
