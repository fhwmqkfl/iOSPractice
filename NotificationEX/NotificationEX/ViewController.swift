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

var testArray: [String] = ["0"]

class ViewController: UIViewController {
    @IBOutlet weak var TestSwitch: UISwitch!
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 앱 On/off기준
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TestSwitch.isOn =  UserDefaults.standard.bool(forKey: "switchState")
        
        let isOn = TestSwitch.isOn ? 1 : 0
        if isOn == alarmStatus.On.rawValue {
            UNUserNotificationCenter.current().addNotificationRequest()
        } else {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["test"])
        }
        
        mainLabel.text = "\(testArray.count)"
        printPendingNotification()
    }
    
    func notificationStatus( completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            let authorized = settings.authorizationStatus == .authorized
            completion(authorized)
        }
    }
    
    func openSettingPage() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        
        if UIApplication.shared.canOpenURL(settingsUrl)  {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                // TODO: 
            })
        }
    }
    
    func printPendingNotification() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            print(#function)
            print(requests.count)
        }
    }
    
    
    @IBAction func isChanged(_ sender: UISwitch) {

        let result = sender.isOn ? 1 : 0
        UserDefaults.standard.set(TestSwitch.isOn, forKey: "switchState")

        if result == alarmStatus.On.rawValue {
            UNUserNotificationCenter.current().addNotificationRequest()
        } else {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["test"])
        }
        printPendingNotification()
    }
    
    @IBAction func addLabel(_ sender: UIButton) {
        testArray.append("\(testArray.count)")
        DispatchQueue.main.async {
            self.mainLabel.text = "\(testArray.count)"
            UNUserNotificationCenter.current().addNotificationRequest()
        }
    }
}

