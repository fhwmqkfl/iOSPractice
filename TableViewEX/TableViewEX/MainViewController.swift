//
//  MainViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let testLabel = UILabel()
    let mainTableView = UITableView()
    let nameArray: [String] = ["coco", "keen", "kobon", "cherry", "a", "b", "c"]
    let phoneArray: [String] = ["010-1234-1234", "010-1234-1111", "010-1234-2222", "010-1234-3333", "010-1234-4444", "010-1234-5555", "010-1234-6666"]
    var contactList: [Contact] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactTableViewCell")
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        setUI()
        addSubviews()
        setConstraints()
        unitData()
    }
    
    func setUI() {
        view.backgroundColor = .systemBackground
        
        testLabel.backgroundColor = .systemGray
        testLabel.text = "테스트용 레이블입니다"
        
        mainTableView.rowHeight = 100
        
    }
    func addSubviews() {
        view.addSubview(testLabel)
        view.addSubview(mainTableView)
    }
    func setConstraints() {
        testLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(testLabel.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
    }
    func unitData() {
        for i in 0..<nameArray.count {
            let name = nameArray[i]
            let phone = phoneArray[i]
            let contact = Contact(name: name, phone: phone)
            
            contactList.append(contact)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as? ContactTableViewCell else { return UITableViewCell() }
        
        let contact =  contactList[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.phoneLabel.text = contact.phone
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = ModifyViewController()
        let contact = contactList[indexPath.row]
        nextVC.contact = contact
        nextVC.subString = indexPath.row
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}
