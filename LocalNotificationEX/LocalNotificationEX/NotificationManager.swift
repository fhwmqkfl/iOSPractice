//
//  NotificationManager.swift
//  LocalNotificationEX
//
//  Created by yeojuseok on 2024/01/31.
//

import Foundation
import UserNotifications

final class NotificationManager {
    static let instance: NotificationManager = NotificationManager()

    func requestPermission() {
        let options = UNAuthorizationOptions(arrayLiteral: [.alert, .sound, .badge])

        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, _ in
            print("permission granted: \(success)")
        }
    }

    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "Local notification Test"
        content.sound = .default

        let firstTrigger =
        UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        var dateComponents = DateComponents()
        dateComponents.hour = 12
        dateComponents.minute = 1
        let secondTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "notification01", content: content, trigger: secondTrigger)
        UNUserNotificationCenter.current().add(request)
    }
}
