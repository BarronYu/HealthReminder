//
//  ContentView.swift
//  HealthReminder
//
//  Created by Barron Yu on 2025/8/14.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Text("喝水提醒")
                .font(.largeTitle)
                .padding()
            Button(action: {
                scheduleWaterReminder()
            }) {
                Text("开始提醒")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func scheduleWaterReminder() {
        let content = UNMutableNotificationContent()
        content.title = "喝水提醒"
        content.body = "该喝水了！"
        
        // 每隔一小时提醒一次
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
        let request = UNNotificationRequest(identifier: "WaterReminder", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

#Preview {
    ContentView()
}
