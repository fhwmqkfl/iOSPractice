//
//  ModifyViewController.swift
//  TableViewEX
//
//  Created by coco on 2023/05/19.
//

import UIKit
import SnapKit

class ModifyViewController: UIViewController {
    let nameTextField = UITextField()
    let phoneTextField = UITextField()
    let modifyButton = UIButton()
    let verticalStackView = UIStackView()
    
    var index: Int?
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviews()
        setConstraints()
    }
    
    func setupUI() {
        title = "Modify"
        view.backgroundColor = .white
        
        nameTextField.borderStyle = .roundedRect
        phoneTextField.borderStyle = .roundedRect
        
        modifyButton.setTitle("Modify", for: .normal)
        modifyButton.setTitleColor(.systemBlue, for: .normal)
        modifyButton.addTarget(self, action: #selector(modifyButtonClicked), for: .touchUpInside)
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 25
        
        nameTextField.text = contact?.name
        phoneTextField.text = contact?.phone
    }
    
    func addSubviews() {
        verticalStackView.addArrangedSubview(nameTextField)
        verticalStackView.addArrangedSubview(phoneTextField)
        view.addSubview(verticalStackView)
        view.addSubview(modifyButton)
    }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(50)
            $0.leading.equalTo(safeArea).offset(25)
            $0.trailing.equalTo(safeArea).offset(-25)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(verticalStackView.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func modifyButtonClicked() {
        contact?.name = nameTextField.text!
        contact?.phone = phoneTextField.text!
        
        guard let mainVC = self.navigationController?.viewControllers[0] as? MainViewController else { return }
        
        if let index = index, let contact = contact {
            mainVC.contactList[index] = contact
            self.navigationController?.popViewController(animated: true)
        }
    }
}
