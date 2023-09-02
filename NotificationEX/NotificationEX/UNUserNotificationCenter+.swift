//
//  UNUserNotificationCenter+.swift
//  NotificationEX
//
//  Created by coco on 2023/08/30.
//

import Foundation
import UserNotifications

extension UNUserNotificationCenter {
    func addNotificationRequest( ) {
        print(#function)
        let content = UNMutableNotificationContent()
        content.title = "title"
        content.body = "테스트입니다"
        content.sound = .default // 사운드 설정
        content.badge = 1 // 뱃지(앱 아이콘에 표시될 뱃지)

        // 트리거 만들기1
        var date = DateComponents()
        let formmater = DateFormatter()
        formmater.dateFormat = "K" // k는 hour를 24시간제로 보여줍니다.
        date.hour = 23
        formmater.dateFormat = "mm"
        date.minute = 39
        formmater.dateFormat = "ss"
        date.second = 45
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)

        // 리퀘스트 생성
        let request = UNNotificationRequest(identifier: "test", content: content, trigger: trigger)

        // 알림 센터에 등록
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}
