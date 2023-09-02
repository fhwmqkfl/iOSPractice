//
//  ViewController.swift
//  NotificationEX
//
//  Created by coco on 2023/08/30.
//

import UIKit
import UserNotifications

enum alarmStatus: Int {
    case Off // 0
    case On // 1
}

class ViewController: UIViewController {
    @IBOutlet weak var TestSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TestSwitch.isOn =  UserDefaults.standard.bool(forKey: "switchState")
        
        let isOn = TestSwitch.isOn ? 1 : 0
        if isOn == alarmStatus.On.rawValue {
            print("ISON!!")
            UNUserNotificationCenter.current().addNotificationRequest()
        } else {
            print("NO!!!")
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["test"])
        }
    }

    @IBAction func isChanged(_ sender: UISwitch) {
        let result = sender.isOn ? 1 : 0
        UserDefaults.standard.set(TestSwitch.isOn, forKey: "switchState")

        if result == alarmStatus.On.rawValue {
            UNUserNotificationCenter.current().addNotificationRequest()
        } else {
            // 알림 해제
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["test"])
            
        }
    }
}

