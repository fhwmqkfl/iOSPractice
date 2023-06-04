//
//  ViewController.swift
//  SettingAppEX
//
//  Created by coco on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    let firstValue: [(String, UIImage?)] = [("에어플레인 모드", UIImage(systemName: "airplane")), ("Wi-Fi", UIImage(systemName: "wifi")), ("Bluetooth",UIImage(systemName: "bluetooth")), ("셀룰러", UIImage(systemName: "cellularbars")), ("개인용 핫스팟", UIImage(systemName: "personalhotspot"))]
    let secondValue: [(String, UIImage?)] = [("알림", UIImage(systemName: "bell")), ("사운드 및 햅틱", UIImage(systemName: "bell")), ("집중 모드", UIImage(systemName: "bell")), ("스크린 타임", UIImage(systemName: "bell"))]
    let thirdValue: [(String, UIImage?)] = [("일반", UIImage(systemName: "bell")), ("제어센터", UIImage(systemName: "bell")), ("디스플레이 및 밝기", UIImage(systemName: "bell")), ("홈 화면", UIImage(systemName: "bell")), ("손쉬운 사용", UIImage(systemName: "bell")), ("배경화면", UIImage(systemName: "bell")), ("Siri 및 검색", UIImage(systemName: "bell")), ("Face ID 및 암호", UIImage(systemName: "bell")), ("긴급 구조 요청" , UIImage(systemName: "bell")), ("노출 알림", UIImage(systemName: "bell")), ("배터리", UIImage(systemName: "bell")), ("개인정보 보호 및 보안", UIImage(systemName: "bell"))]
    let fourthValue: [(String, UIImage?)] = [("App Store", UIImage(systemName: "airplane")), ("지갑 및 Apple Pay", UIImage(systemName: "airplane"))]
    let fifthValue: [(String, UIImage?)] = [("암호", UIImage(systemName: "personalhotspot")), ("연락처", UIImage(systemName: "personalhotspot")), ("캘린더", UIImage(systemName: "personalhotspot")), ("메모", UIImage(systemName: "personalhotspot")), ("미리 알림", UIImage(systemName: "personalhotspot")), ("전화", UIImage(systemName: "personalhotspot")), ("메세지", UIImage(systemName: "personalhotspot")), ("FaceTime", UIImage(systemName: "personalhotspot"))]
    var settingList: [(headerTitle: String, [(title: String, image: UIImage?)])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        title = "설정"
        settingList = [(" ", firstValue), ("ALARM", secondValue), ("GENERAL", thirdValue), ("APP & PAY", fourthValue), (" ", fifthValue)]
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as? SettingTableViewCell else { return UITableViewCell() }
        let data = settingList[indexPath.section].1[indexPath.row]
        cell.settingLabel.text = data.title
        cell.settingImageView.image = data.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settingList[section].headerTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

