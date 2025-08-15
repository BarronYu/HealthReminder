import SwiftUI
import Combine

struct SettingsView: View {
    @State private var selectedMode: TimerMode = .interval
    @State private var selectedInterval: String = "5分钟" // 默认选择
    let intervals = ["1分钟", "5分钟", "10分钟", "15分钟", "30分钟"]

    var body: some View {
        VStack {
            Picker("选择计时方式", selection: $selectedMode) {
                Text("间隔计时").tag(TimerMode.interval)
                Text("固定计时").tag(TimerMode.fixed)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedMode == .interval {
                Picker("选择时间间隔", selection: $selectedInterval) {
                    ForEach(intervals, id: \.self) { interval in
                        Text(interval).tag(interval)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()

                Button("开始间隔计时") {
                    let totalInterval = getTotalInterval(from: selectedInterval)
                    NotificationManager.shared.scheduleIntervalNotifications(interval: totalInterval)
                }
                .padding()
            } else {
                // 固定时间输入
                // 这里可以使用 DatePicker 或其他方式让用户输入多个时间点
                // 这里省略具体实现
                Button("开始固定计时") {
                    NotificationManager.shared.scheduleFixedNotifications(times: [])
                }
                .padding()
            }
        }
        .padding()
    }
    
    private func getTotalInterval(from interval: String) -> TimeInterval {
        switch interval {
        case "1分钟":
            return 60
        case "5分钟":
            return 300
        case "10分钟":
            return 600
        case "15分钟":
            return 900
        case "30分钟":
            return 1800
        default:
            return 0
        }
    }
}
