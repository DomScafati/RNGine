//
//  RollHistoryView.swift
//  RNGine
//
//  Created by Dom S on 11/12/25.
//

import Foundation

struct RollRecord: Identifiable {
    let id = UUID()
    let value: Int
    let date: Date
}

actor RollHistory {
    private var store = [Die:[RollRecord]]()
    
    func add(at die: Die, value: RollRecord) {
        self.store[die]?.append(value)
    }
    
    func get(at die: Die) -> [RollRecord]{
        var array = [RollRecord]()
        guard let key = self.store[die] else { return [] }
        for value in key {
            array.append(value)
        }
        
        return array
    }
    
    func clear() {
        self.store.removeAll()
    }
    
    func clear(at die: Die) {
        self.store.removeValue(forKey: die)
    }
}
