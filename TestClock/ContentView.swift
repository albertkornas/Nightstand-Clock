//
//  ContentView.swift
//  TestClock
//
//  Created by Albert Kornas on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ssa"
        return formatter
    }
    
    func timeCharactersArray(date: Date) -> [String] {
        let time: String = timeFormat.string(from: date)
        let timeArray = time.map{String($0)}
        return timeArray
    }
    
    var body: some View {
        HStack {
            ForEach(timeCharactersArray(date: date).indices, id: \.self) { index in
                withAnimation(.linear(duration: 0.25), {
                Text(timeCharactersArray(date: date)[index])
                    .padding()
                    .frame(width: 50, height: 100)
                    .background(SwiftUI.Color.gray)
                    .transition(.opacity)
                    .id(timeCharactersArray(date: date)[index].description)
                    .onAppear(perform: {let _ = self.updateTimer})
                })
            }
            
        }
    }
    
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                withAnimation(.linear(duration: 0.25), {
                                 self.date = Date()
                                })
                               })
            
    }
    
}
