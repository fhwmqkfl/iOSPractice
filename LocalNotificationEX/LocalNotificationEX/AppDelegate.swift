//
//  AppDelegate.swift
//  LocalNotificationEX
//
//  Created by yeojuseok on 2024/01/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {


    // 앱 시작시 앱 설정이 완료된때 호출
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NotificationManager.instance.requestPermission()

        UNUserNotificationCenter.current().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle
    // 새장면이나 새 창이 필요할때 => 앱시작시 호출되진않음
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print(#function)
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        print(#function)
    }


}

