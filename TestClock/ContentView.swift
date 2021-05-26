//
//  ContentView.swift
//  TestClock
//
//  Created by Albert Kornas on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
    
    var hourFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h"
        return formatter
    }
    
    var minuteFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        return formatter
    }
    
    var secondsFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "ss a"
        return formatter
    }
    
    //Return array of hour, format, and seconds TODO: convert into dict
    func timeCharacters(date: Date) -> [String] {
        let hour: String = hourFormat.string(from: date)
        let minute: String = minuteFormat.string(from: date)
        let second: String = secondsFormat.string(from: date)
        let timeArray: [String] = [hour, minute, second]
        return timeArray
    }
    
    var body: some View {
        HStack {
            Group {
            Text(timeCharacters(date: date)[0])
                .padding()
                .background(SwiftUI.Color.gray)
                .transition(.opacity)
                .id("digitz" + timeCharacters(date: date)[0].description)
                .onAppear(perform: {let _ = self.updateSecond})
                Text(timeCharacters(date: date)[2])
                    .padding()
                    .background(SwiftUI.Color.gray)
                    .transition(.opacity)
                    .id("digitz" + timeCharacters(date: date).description)
                    .onAppear(perform: {let _ = self.updateSecond})
            }
        }
    }
    
   /* var updateTimer: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                 self.date = Date()
                                
                               })
            
    }
    */
    
    var updateHour: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                 self.date = Date()
                                
                               })
            
    }
    
    var updateMinute: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                 self.date = Date()
                                
                               })
            
    }
    
    var updateSecond: Timer {
         Timer.scheduledTimer(withTimeInterval: 1, repeats: true,
                              block: {_ in
                                withAnimation(.linear(duration: 0.25), {
                                 self.date = Date()
                                })
                               })
            
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
