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
    var sectionList: [(section: TestSection, content: [Any])] = []
    
    enum TestSection: String {
        case number = "숫자"
        case alpabet = "알파벳"
        case hangul = "한글"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableVIew.dataSource = self
        mainTableVIew.delegate = self
        
        sectionList = [(.number, numberList), (.alpabet, alpabetList), (.hangul, hangulList)]
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionList[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell") as? TestTableViewCell else { return UITableViewCell()}
        
        let content = sectionList[indexPath.section].content
        let text = "\(content[indexPath.row])"
        cell.mainLabel.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section].section.rawValue
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // 갯수
        let content = sectionList[section].content
        let count = content.count
        return "총 : \(count)"
    }

}
