import SwiftUI

struct ContentView: View {
    @State private var notificationScheduled = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SettingsView()) {
                    Text("设置计时")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // 请求通知权限按钮
                Button(action: {
                    NotificationManager.shared.requestAuthorization { granted in
                        if granted {
                            print("通知权限已获得")
                        } else {
                            print("通知权限被拒绝")
                        }
                    }
                }) {
                    Text("请求通知权限")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()


                // 安排通知按钮
                Button(action: {
                    let times: [Date] = [Date().addingTimeInterval(60 * 1)] // 1分钟后
                    NotificationManager.shared.scheduleFixedNotifications(times: times)
                    notificationScheduled = true
                }) {
                    Text(notificationScheduled ? "通知已安排" : "安排通知")
                        .font(.title)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                // 取消通知按钮
                Button(action: {
                    NotificationManager.shared.cancelAllNotifications()
                    notificationScheduled = false
                    print("所有通知已取消")
                }) {
                    Text("取消所有通知")
                        .font(.title)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("健康提醒")
        }
    }
}
