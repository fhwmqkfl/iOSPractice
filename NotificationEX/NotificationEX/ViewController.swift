//
//  ViewController.swift
//  NotificationEX
//
//  Created by coco on 2023/08/30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1. 인스턴스 가져옴(싱글톤)
//        let unc = UNUserNotificationCenter.current()
        UNUserNotificationCenter.current().addNotificationRequest()
    }

}

