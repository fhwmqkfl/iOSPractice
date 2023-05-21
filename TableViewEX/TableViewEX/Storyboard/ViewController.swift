//
//  ViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var contactTableView: UITableView!
    
    let nameArray: [String] = ["coco", "keen", "kobon", "cherry", "a", "b", "c"]
    let phoneArray: [String] = ["010-1234-1234", "010-1234-1111", "010-1234-2222", "010-1234-3333", "010-1234-4444", "010-1234-5555", "010-1234-6666"]
    var contactList: [Contact] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contactTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        unitData()
    }
    
    func unitData() {
        for i in 0..<nameArray.count {
            let name = nameArray[i]
            let phone = phoneArray[i]
            let contact = Contact(name: name, phone: phone)
            
            contactList.append(contact)
        }
    }
    
    func showDeleteAlert(_ tableView: UITableView, indexpath: IndexPath, title: String, content: String = "") {
        let alert = UIAlertController(title: title, message: content, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let delete = UIAlertAction(title: "삭제", style: .destructive) { _ in
            self.deleteData(tableView, indexpath: indexpath)
        }
        
        alert.addAction(cancel)
        alert.addAction(delete)
            
        self.present(alert, animated: true)
    }
    
    func deleteData(_ tableView: UITableView, indexpath: IndexPath) {
        contactList.remove(at: indexpath.row)
        tableView.deleteRows(at: [indexpath], with: .fade)
    }

    @IBAction func addButtonClicked(_ sender: UIButton) {
        // 값이 ContactModel에 추가되어야함
        // 1. 값을 찢어주자
        let inputText = inputTextField.text!
        let inputArray = inputText.components(separatedBy: " / ")
        
        // 2개인지 체크 아니면
        if inputArray.count == 2 {
            let nemName = inputArray[0]
            let newPhone = inputArray[1]
            let contact = Contact(name: nemName, phone: newPhone)
            contactList.append(contact)
            contactTableView.reloadData()
        } else {
            print("nono")
        }
        
        inputTextField.text = ""
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contextCell") as? ContextTableViewCell else { return UITableViewCell()}
        let contact =  contactList[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.phoneLabel.text = contact.phone
        cell.selectionStyle = .none
        
        return cell
    }
    
    // 화면 삭제 애니메이션 기능
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactList.remove(at: indexPath.row)
            contactTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        showDeleteAlert(tableView, indexpath: indexPath, title: "정말 삭제하시겠습니까?")
        let nextVC = ModifyViewController()
        let contact = contactList[indexPath.row]
        nextVC.contact = contact
        nextVC.subString = indexPath.row
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
}
