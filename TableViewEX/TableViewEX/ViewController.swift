//
//  ViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/18.
//

import UIKit

class ViewController: UIViewController {
    
    var contactList: [Contact] = []
    
    let nameArray: [String] = ["coco", "keen", "kobon", "cherry", "a", "b", "c"]
    let phoneArray: [String] = ["010-1234-1234", "010-1234-1111", "010-1234-2222", "010-1234-3333", "010-1234-4444", "010-1234-5555", "010-1234-6666"]

    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contactTableView.dataSource = self
        contactTableView.delegate = self
        
        for i in 0..<nameArray.count {
            let name = nameArray[i]
            let phone = phoneArray[i]
            
            let contact = Contact(name: name, phone: phone)
            
            contactList.append(contact)
        }

    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contextCell") as? ContextTableViewCell else { return UITableViewCell()}
        let contact =  contactList[indexPath.row]
        cell.nameLabel.text = contact.name
        cell.phoneLabel.text = contact.phone
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
