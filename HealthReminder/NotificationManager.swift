import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    private init() {}

    // 请求通知权限
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("请求通知权限时出错: \(error.localizedDescription)")
            }
            completion(granted)
        }
    }

    func scheduleIntervalNotifications(interval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = "喝水提醒"
        content.body = "该喝水了！"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }

    func scheduleFixedNotifications(times: [Date]) {
        let content = UNMutableNotificationContent()
        content.title = "喝水提醒"
        content.body = "该喝水了！"
        content.sound = UNNotificationSound.default
        
        for time in times {
            let triggerDate = Calendar.current.dateComponents([.hour, .minute, .second], from: time)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    // 取消所有通知
    func cancelAllNotifications() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
}
