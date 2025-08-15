import Foundation

enum TimerMode {
    case interval
    case fixed
}

struct TimerSettings {
    var mode: TimerMode
    var interval: TimeInterval? // For interval mode
    var fixedTimes: [Date]? // For fixed mode
}
