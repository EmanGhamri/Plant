import UserNotifications

class NotificationManager {

    static let shared = NotificationManager()

    // true = fires after 10 seconds, so you can test quickly
    private let testing = true

    // Ask the user for permission
    func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    // Create the notification for one plant
    func schedule(for plant: Plant) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default

        let seconds: TimeInterval = testing ? 10 : TimeInterval(plant.days.days * 24 * 60 * 60)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: !testing)

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
