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
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
        
        setUI()
        addSubviews()
        setConstraints()
    }
    
    func setUI() {
        view.backgroundColor = .systemBackground
        
        testLabel.backgroundColor = .systemGray
        testLabel.text = "테스트용 레이블입니다"
        
        // 컬러 알기 위함(수정예정)
        tableView.backgroundColor = .orange
        tableView.rowHeight = 100
        
    }
    func addSubviews() {
        view.addSubview(testLabel)
        view .addSubview(tableView)
    }
    func setConstraints() {
        testLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(testLabel.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(0)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(0)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as? ContactTableViewCell else { return UITableViewCell() }
        
        cell.nameLabel.text = "이름은"
        cell.phoneLabel.text = "레이블을 변경했습니다"

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
}
