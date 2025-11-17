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

actor RollHistory: RollHistoryProtocol {
    private var store = [Die:[RollRecord]]()
    
    func add(_ record: RollRecord, at die: Die) {
        self.store[die, default: []].append(record)
        print(store)
    }
    
    func get(for die: Die) -> [RollRecord]{
        return self.store[die] ?? []
    }
    
    func clear() {
        self.store.removeAll()
    }
    
    func clear(at die: Die) {
        self.store.removeValue(forKey: die)
    }
    
    init(store: [Die : [RollRecord]] = [:]) {
        self.store = store
    }
}

protocol RollHistoryProtocol {
    func add(_ record: RollRecord, at die: Die) async
    func get(for die: Die) async -> [RollRecord]

}
