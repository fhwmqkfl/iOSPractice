//
//  ViewController.swift
//  LocalNotificationEX
//
//  Created by yeojuseok on 2024/01/30.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    //UNUserNotificationCenter : to manage all notification-related behaviors in your app or app extension
    let center = UNUserNotificationCenter.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func buttenClicked(_ sender: UIButton) {
        print(#function)
        NotificationManager.instance.sendNotification()
    }
}

