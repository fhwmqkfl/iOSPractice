//
//  AppDelegate.swift
//  NotificationEX
//
//  Created by coco on 2023/08/30.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 알림 센터 가져오기
        let center = UNUserNotificationCenter.current()
        center.delegate = self // extension
        
        // 권한 종류 가져오기(뱃지&소리)
        let options = UNAuthorizationOptions(arrayLiteral: [.badge, .sound])
        
        // 권한 요청 메서드(꼭 이곳이 아니여도 원할때 권한을 받을 수 있음)
        center.requestAuthorization(options: options) { success, error in
            if let error = error { print("에러 발생! : \(error.localizedDescription)") }
        }
        
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    // foreground있을때 알림있으면 이 메서드 호출
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 푸쉬가 오면 다음 표시
        completionHandler([.badge, .banner, .list, .sound])
    }
    
    // 사용자가 알림을 터치하면 이 메서드 호출
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        <#code#>
//    }
}

