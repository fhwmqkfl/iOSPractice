//
//  ViewController.swift
//  SettingAppEX
//
//  Created by coco on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    var settingList: [Setting] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        title = "설정"
        setupSettingList()
    }
    
    func setupSettingList() {
        settingList = [
            Setting(
                headerTitle: " ",
                menu: [
                    Menu(settingtitle: "에어플레인 모드", settingImage: UIImage(systemName: "airplane")),
                    Menu(settingtitle: "Wi-Fi", settingImage: UIImage(systemName: "wifi")),
                    Menu(settingtitle: "Bluetooth", settingImage: UIImage(systemName: "bluetooth")),
                    Menu(settingtitle: "셀룰러", settingImage: UIImage(systemName: "cellularbars")),
                    Menu(settingtitle: "개인용 핫스팟", settingImage: UIImage(systemName: "personalhotspot"))
                ]
            ),
            Setting(
                headerTitle: "ALARM",
                menu: [
                    Menu(settingtitle: "알림", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "사운드 및 햅틱", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "집중 모드", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "스크린 타임", settingImage: UIImage(systemName: "bell"))
                ]
            ),
            Setting(
                headerTitle: "GENERAL",
                menu: [
                    Menu(settingtitle: "일반", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "제어센터", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "디스플레이 및 밝기", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "홈 화면", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "손쉬운 사용", settingImage: UIImage(systemName: "cellularbars")),
                    Menu(settingtitle: "배경화면", settingImage: UIImage(systemName: "personalhotspot")),
                    Menu(settingtitle: "Siri 및 검색", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "Face ID 및 암호", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "긴급 구조 요청", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "노출 알림", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "배터리", settingImage: UIImage(systemName: "bell")),
                    Menu(settingtitle: "개인정보 보호 및 보안", settingImage: UIImage(systemName: "personalhotspot"))
                ]
            ),
            Setting(
                headerTitle: "APP & PAY",
                menu: [
                    Menu(settingtitle: "App Store", settingImage: UIImage(systemName: "airplane")),
                    Menu(settingtitle: "지갑 및 Apple Pay", settingImage: UIImage(systemName: "airplane"))
                ]
            ),
            Setting(
                headerTitle: " ",
                menu: [
                    Menu(settingtitle: "암호", settingImage: UIImage(systemName: "personalhotspot")),
                    Menu(settingtitle: "연락처", settingImage: UIImage(systemName: "airplane")),
                    Menu(settingtitle: "캘린더", settingImage: UIImage(systemName: "personalhotspot")),
                    Menu(settingtitle: "메모", settingImage: UIImage(systemName: "personalhotspot")),
                    Menu(settingtitle: "미리 알림", settingImage: UIImage(systemName: "personalhotspot")),
                    Menu(settingtitle: "전화", settingImage: UIImage(systemName: "personalhotspot"))
                ]
            )
        ]
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as? SettingTableViewCell else { return UITableViewCell() }
        let data = settingList[indexPath.section].menu[indexPath.row]
        cell.settingLabel.text = data.settingtitle
        cell.settingImageView.image = data.settingImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingList[section].headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
