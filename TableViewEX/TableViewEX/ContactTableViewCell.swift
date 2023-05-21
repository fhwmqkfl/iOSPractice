//
//  ContactTableViewCell.swift
//  TableViewEX
//
//  Created by coco on 2023/05/21.
//

import UIKit
import SnapKit

class ContactTableViewCell: UITableViewCell {
    lazy var nameLabel = UILabel()
    lazy var phoneLabel = UILabel()
    lazy var VerticalStackView = UIStackView()
    
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

        VerticalStackView.axis = .vertical
        VerticalStackView.spacing = 10

        self.contentView.addSubview(VerticalStackView)
        
        VerticalStackView.addArrangedSubview(nameLabel)
        VerticalStackView.addArrangedSubview(phoneLabel)
        
        nameLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
    }
    
    func setConstraints() {
        VerticalStackView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(10)
            $0.leading.equalTo(self.contentView.snp.leading).offset(10)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            $0.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }
}
