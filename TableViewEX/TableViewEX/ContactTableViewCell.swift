//
//  ContactTableViewCell.swift
//  TableViewEX
//
//  Created by coco on 2023/05/21.
//

import UIKit
import SnapKit

class ContactTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let phoneLabel = UILabel()
    let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        nameLabel.backgroundColor = .systemGray2
        phoneLabel.backgroundColor = .lightGray

        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10

        self.contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(phoneLabel)
        
        nameLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
    }
    
    func setConstraints() {
        verticalStackView.snp.makeConstraints {
            $0.top.leading.equalTo(self.contentView).offset(10)
            $0.bottom.trailing.equalTo(self.contentView).offset(-10)
        }
    }
}
