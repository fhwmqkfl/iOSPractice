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

var testArray: [String] = []

class ViewController: UIViewController {
    @IBOutlet weak var TestSwitch: UISwitch!
    @IBOutlet weak var mainLabel: UILabel!

    var notiSetting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotification()
        mainLabel.text = "\(testArray.count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        enterForeground()
    }
    
    // TODO: 커밋후 화면 전환시 확인위해 추가해놓음
    deinit {
        NotificationCenter.default.removeObserver(self)
        print(#function)
    }
    
    func notificationStatus(completion: @escaping (Bool) -> Void) {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            let authorized = settings.authorizationStatus == .authorized
            completion(authorized)
        }
    }
    
    func openSettingPage() {
        let alertController = UIAlertController (title: "Title", message: "알람수신을 확인해야 알람을 받을수 있어요", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) { UIApplication.shared.open(settingsUrl) }
            
            self.TestSwitch.isOn = false
        }
        
        let cancelAction = UIAlertAction(title: "okay", style: .default) { _ in
            self.TestSwitch.isOn = false
        }
        
        alertController.addAction(settingsAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
        
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(enterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func enterForeground() {
        UNUserNotificationCenter.current().getNotificationSettings { status in
            self.notiSetting = status.authorizationStatus == .authorized
            DispatchQueue.main.async {
                if self.notiSetting {
                    self.TestSwitch.isOn = UserDefaults.standard.bool(forKey: "switchState") ? true : false
                } else {
                    self.TestSwitch.isOn = false
                }
            }
        }
    }
    
    @IBAction func isChanged(_ sender: UISwitch) {
        // 알림설정이 안되있는 경우 -> 설정으로 유도해야
        if !notiSetting, sender.isOn {
            openSettingPage()
            return
        }
        
        let result = sender.isOn ? 1 : 0
        UserDefaults.standard.set(TestSwitch.isOn, forKey: "switchState")

        if result == alarmStatus.On.rawValue {
            UNUserNotificationCenter.current().addNotificationRequest()
        } else {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["test"])
        }
    }
    
    @IBAction func addLabel(_ sender: UIButton) {
        testArray.append("\(testArray.count)")
        DispatchQueue.main.async {
            self.mainLabel.text = "\(testArray.count)"
            UNUserNotificationCenter.current().addNotificationRequest()
        }
    }
}

