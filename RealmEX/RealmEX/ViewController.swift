//
//  ViewController.swift
//  RealmEX
//
//  Created by coco on 2023/07/04.
//

import UIKit
import RealmSwift

enum Gender: String, PersistableEnum {
    case man
    case woman
    case none
}

class Person: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var age: Int
    @Persisted var gender: Gender = .none
    
    convenience init(name: String, age: Int, gender: Gender) {
        self.init()
        self.name = name
        self.age = age
        self.gender = gender
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var numberingLabel: UILabel!
    
    let realm = try! Realm()
    let udid = "udNumbering"
    var numbering: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// relam local file url
//        print("file url: \(realm.configuration.fileURL)")
        let personList = realm.objects(Person.self)
        if UserDefaults.standard.integer(forKey: udid) == 0 {
            UserDefaults.standard.setValue(0, forKey: udid)
        }
        numbering = UserDefaults.standard.integer(forKey: udid)
        numberingLabel.text = "\(numbering), count: \(personList.count)"
    }
    
    func add(person: Person) {
        try! realm.write {
            realm.add(person)
        }
    }
    
    func delete(person: Person) {
        try! realm.write {
            realm.delete(person)
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let genderList: [Gender] = [.woman, .none]
        let personList = realm.objects(Person.self)
        let randomGender = genderList.randomElement() ?? .woman
        let newPerson = Person(name: "name_\(numbering)", age: numbering, gender: randomGender)
        add(person: newPerson)
        
        numbering += 1
        UserDefaults.standard.setValue(numbering, forKey: udid)
        numberingLabel.text = "\(UserDefaults.standard.integer(forKey: udid)) / count: \(personList.count)"
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        let personList = realm.objects(Person.self)
        let person = personList[0]
        delete(person: person)
        numberingLabel.text = "\(UserDefaults.standard.integer(forKey: udid)) / count: \(personList.count)"
    }
}

