//
//  ViewController.swift
//  SettingAppEX
//
//  Created by coco on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    let firstValue: [String] = ["에어플레인 모드", "Wi-Fi", "Bluetooth", "셀룰러", "개인용 핫스팟"]
    let secondValue: [String] = ["알림", "사운드 및 햅틱", "집중 모드", "스크린 타임"]
    let thirdValue: [String] = ["일반", "제어센터", "디스플레이 및 밝기", "홈 화면", "손쉬운 사용", "배경화면", "Siri 및 검색", "Face ID 및 암호", "긴급 구조 요청", "노출 알림", "배터리", "개인정보 보호 및 보안"]
    let fourthValue: [String] = ["App Store", "지갑 및 Apple Pay"]
    let fifthValue: [String] = ["암호", "연락처", "캘린더", "메모", "미리 알림", "전화", "메세지", "FaceTime"]
    var settingList: [[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        title = "설정"
        settingList = [firstValue, secondValue, thirdValue, fourthValue, fifthValue]
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as? SettingTableViewCell else { return UITableViewCell() }
        cell.settingLabel.text = settingList[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerUIView = UIView()
        footerUIView.backgroundColor = .systemGray6
        return footerUIView
    }
}

