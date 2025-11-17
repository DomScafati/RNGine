//
//  RollHistoryView.swift
//  RNGine
//
//  Created by Dom S on 11/12/25.
//

import SwiftUI
import Charts

struct RollHistoryView: View {
    let data: [RollRecord] = []
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .padding(.bottom)
            
            Chart(data) {
                LineMark(
                    x: .value("Date", $0.date),
                    y: .value("Roll", $0.value)
                )
            }
            .padding()
        }
        
    }
}

#Preview {
    var data = [
        RollRecord(value: 3, date: Date()),
        RollRecord(value: 2, date: Date()),
        RollRecord(value: 20, date: Date())
    ]
    
    RollHistoryView()
}
