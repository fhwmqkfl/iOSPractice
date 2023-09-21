//
//  ViewController.swift
//  NotificationEX
//
//  Created by coco on 2023/08/30.
//

import UIKit
import UserNotifications

var testArray: [String] = ["0"]

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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        
        UserDefaults.standard.set(TestSwitch.isOn, forKey: "switchState")

        if sender.isOn {
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

