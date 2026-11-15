import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    
    // true = fires after 10 seconds, so you can test quickly
    
    // Ask the user for permission
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }
    
    func interval(for plant: Plant) -> TimeInterval {
        plant.days.seconds
    }
    
    // Create the notification for one plant
    func schedule(for plant: Plant) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval(for: plant), repeats: false)
        
        let request = UNNotificationRequest(
            identifier: plant.id.uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    // Remove a plant's notification
    func cancel(for plant: Plant) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
}
