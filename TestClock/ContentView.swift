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
        formatter.dateFormat = "hh:mm:ss a"
        return formatter
    }
    
    
    func timeCharacters(date: Date) -> [String] {
        let time: String = timeFormat.string(from: date)
        let timeArray = time.map{String($0)}
        return timeArray
    }
    
    var body: some View {
        HStack {
            ForEach(timeCharacters(date: date), id: \.self) { digit in
                withAnimation(.linear(duration: 0.25), {
                Text(digit)
                    .padding()
                    .background(SwiftUI.Color.gray)
                    .transition(.opacity)
                    .id("digitz" + timeCharacters(date: date).description)
                    .onAppear(perform: {let _ = self.updateTimer})
                })
            }
            
        }
    }
    
    var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                 self.date = Date()
                                
                               })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
