//
//  ViewController.swift
//  SectionEX
//
//  Created by coco on 2023/05/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainTableVIew: UITableView!
    
    let numberList: [Int] = [1, 2, 3, 4, 5] // first section
    let alpabetList: [String] = ["a", "b", "c"] // second section
    let hangulList: [String] = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅏ"]
    let sectionList: [String] = ["NUMBER", "ALPABET", "HANGUL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableVIew.dataSource = self
        mainTableVIew.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return numberList.count
        } else if section == 1 {
            return alpabetList.count
        } else {
            return hangulList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell") as? TestTableViewCell else { return UITableViewCell()}
        if indexPath.section == 0 {
            cell.mainLabel.text = "\(numberList[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.mainLabel.text = alpabetList[indexPath.row]
        } else {
            cell.mainLabel.text = hangulList[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // 1번. for문
//        if section == 0 {
//            return "count : \(numberList.count)"
//        } else if section == 1 {
//            return "count : \(alpabetList.count)"
//        } else {
//            return "count : \(hangulList.count)"
//        }
        // 2번 리스트만듬
        let footerList: [Int] = [numberList.count, alpabetList.count, hangulList.count]
        return "count: \(footerList[section])"
        
    }
}
