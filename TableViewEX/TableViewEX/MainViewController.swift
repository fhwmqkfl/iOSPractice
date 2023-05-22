//
//  MainViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/21.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let textField = UITextField()
    let addButton = UIButton()
    let horizontalStackView = UIStackView()
    
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
        
        textField.placeholder = "name / phonenumber"
        textField.borderStyle = .roundedRect
        textField.frame.size.height = 20
        
        addButton.setTitle("add", for: .normal)
        addButton.setTitleColor(.systemBlue, for: .normal)
        addButton.layer.borderColor = UIColor.systemGray2.cgColor
        addButton.layer.borderWidth = 0.2
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillProportionally
    }
    
    func addSubviews() {
        view.addSubview(horizontalStackView)
        view.addSubview(mainTableView)
        
        horizontalStackView.addArrangedSubview(textField)
        horizontalStackView.addArrangedSubview(addButton)
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        horizontalStackView.snp.makeConstraints {
            $0.top.leading.equalTo(safeArea).offset(10)
            $0.trailing.equalTo(safeArea).offset(-10)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(horizontalStackView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    func unitData() {
        let tupleArray = zip(nameArray, phoneArray)
        
        // todo -> map 사용
        for data in tupleArray {
            let contact = Contact(name: data.0 , phone: data.1)
            contactList.append(contact)
        }
    }
    
    @objc func addButtonTapped() {
        // 1. 값을 찢어주자
        let inputText = textField.text!
        let inputArray = inputText.components(separatedBy: " / ")
        
        // 2개인지 체크 아니면
        if inputArray.count == 2 {
            let nemName = inputArray[0]
            let newPhone = inputArray[1]
            let contact = Contact(name: nemName, phone: newPhone)
            contactList.append(contact)
            mainTableView.reloadData()
        } else {
            print("nono")
        }
        
        textField.text = ""
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
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modifyVC = ModifyViewController()
        let contact = contactList[indexPath.row]
        modifyVC.contact = contact
        modifyVC.index = indexPath.row
        
        self.navigationController?.pushViewController(modifyVC, animated: true)
    }
}
