//
//  ModifyViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/19.
//

import UIKit
import SnapKit

class ModifyViewController: UIViewController {
    var nameTextField = UITextField()
    var phoneTextField = UITextField()
    let modifyButton = UIButton()
    let verticalStackVIew = UIStackView()
    
    var subString: Int?
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
        setConstraints()
        
        nameTextField.text = contact?.name
        phoneTextField.text = contact?.phone
    }
    
    func setupUI() {
        title = "Modify"
        view.backgroundColor = .white
        
        nameTextField.borderStyle = .roundedRect
        phoneTextField.borderStyle = .roundedRect
        
        modifyButton.setTitle("Modify", for: .normal)
        modifyButton.setTitleColor(.systemBlue, for: .normal)
        modifyButton.addTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
        
        verticalStackVIew.axis = .vertical
        verticalStackVIew.spacing = 25
    }
    
    func addSubviews() {
        verticalStackVIew.addArrangedSubview(nameTextField)
        verticalStackVIew.addArrangedSubview(phoneTextField)
        view.addSubview(verticalStackVIew)
        view.addSubview(modifyButton)
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        verticalStackVIew.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(50)
            $0.leading.equalTo(safeArea).offset(25)
            $0.trailing.equalTo(safeArea).offset(-25)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(verticalStackVIew.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func modifyButtonClicked() {
        contact?.name = nameTextField.text!
        contact?.phone = phoneTextField.text!
        
        let mainVC = self.navigationController?.viewControllers[0] as! MainViewController
        mainVC.contactList[subString!] = contact!
        
        self.navigationController?.popViewController(animated: true)
    }
}
