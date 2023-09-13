//
//  FirstViewController.swift
//  NotificationEX
//
//  Created by coco on 2023/09/13.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        printPendingNotification()
    }
    
    /// Check to notification array
    func printPendingNotification() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            print("현재 알람 등록되있는 갯수 : \(requests.count)")
        }
    }
}
