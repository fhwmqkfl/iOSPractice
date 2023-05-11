//
//  PracticeViewController.swift
//  SnapKitEx
//
//  Created by coco on 2023/05/11.
//

import UIKit
import SnapKit

class PracticeViewController: UIViewController {
    let redView = UIView()
    let blueView = UIView()
    let pinkView = UIView()
    
    let firstYellowView = UIView()
    let secondYellowView = UIView()
    let firstGreenView = UIView()
    let secondGreenView = UIView()
    
    let buttonStackView = UIStackView()
    let yellowStackView = UIStackView()
    let verticalStackVIew = UIStackView()
    let horizontalStackView = UIStackView()
    
    let firstBtn = UIButton()
    let secondBtn = UIButton()
    let thirdBtn = UIButton()
    let fourthBtn = UIButton()
    
    let firstLabel = UILabel()
    let secondLable = UILabel()
    let thirdLabel = UILabel()
    let fourthLabel = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSetup()
        addSubview()
        setupConstraints()
    }
    
    // component setup
    func initSetup() {
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        pinkView.backgroundColor = .systemPink
        
        firstYellowView.backgroundColor = .yellow
        secondYellowView.backgroundColor = .yellow
        firstGreenView.backgroundColor = .green
        secondGreenView.backgroundColor = .green
        
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        
        yellowStackView.distribution = .fillEqually
        yellowStackView.spacing = 10
        
        verticalStackVIew.axis = .vertical
        
        horizontalStackView.spacing = 10
//        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .top
        
        
        firstBtn.setTitle("first", for: .normal)
        secondBtn.setTitle("second", for: .normal)
        thirdBtn.setTitle("third", for: .normal)
        fourthBtn.setTitle("버튼1", for: .normal)
        
        firstBtn.backgroundColor = .white
        secondBtn.backgroundColor = .white
        thirdBtn.backgroundColor = .white
        fourthBtn.backgroundColor = .white
        
        firstBtn.setTitleColor(.black, for: .normal)
        secondBtn.setTitleColor(.black, for: .normal)
        thirdBtn.setTitleColor(.black, for: .normal)
        fourthBtn.setTitleColor(.black, for: .normal)
        
        firstLabel.font = UIFont.boldSystemFont(ofSize: 13)
        secondLable.font = UIFont.boldSystemFont(ofSize: 13)
        thirdLabel.font = UIFont.boldSystemFont(ofSize: 13)
        fourthLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        firstLabel.text = "이것은 Label 이것은 Label"
        secondLable.text = "이것은 Label 이것은 Label"
        thirdLabel.text = "이것은 Label 이것은 Label"
        fourthLabel.text = "이것은 Label 이것은 Label"
        
        
    }
    
    // add subView
    func addSubview() {
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(pinkView)
        self.view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(firstBtn)
        buttonStackView.addArrangedSubview(secondBtn)
        buttonStackView.addArrangedSubview(thirdBtn)
        self.view.addSubview(fourthBtn)
        
        self.view.addSubview(yellowStackView)
        yellowStackView.addArrangedSubview(firstYellowView)
        yellowStackView.addArrangedSubview(secondYellowView)
        self.view.addSubview(firstGreenView)
        self.view.addSubview(secondGreenView)
        
        self.view.addSubview(horizontalStackView)
        self.view.addSubview(verticalStackVIew)
        
        verticalStackVIew.addArrangedSubview(firstLabel)
        verticalStackVIew.addArrangedSubview(secondLable)
        verticalStackVIew.addArrangedSubview(thirdLabel)
        verticalStackVIew.addArrangedSubview(fourthLabel)
        
        horizontalStackView.addArrangedSubview(pinkView)
        horizontalStackView.addArrangedSubview(verticalStackVIew)
        
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        redView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).offset(10)
            $0.trailing.equalTo(safeArea.snp.trailing).offset(-10)
            $0.top.equalTo(safeArea.snp.top).offset(10)
            $0.height.equalTo(450)
        }
        
        blueView.snp.makeConstraints {
            // 높이는 상위 redView의 절반값 설정
            $0.height.equalTo(redView.snp.height).multipliedBy(0.5)
            $0.top.equalTo(redView.snp.top).offset(10)
            $0.leading.equalTo(redView.snp.leading).offset(10)
            $0.trailing.equalTo(redView.snp.trailing).offset(-10)
        }
        
        yellowStackView.snp.makeConstraints {
            $0.leading.equalTo(safeArea.snp.leading).offset(10)
            $0.trailing.equalTo(safeArea.snp.trailing).offset(-10)
            $0.top.equalTo(redView.snp.bottom).offset(10)
        }
        
        firstYellowView.snp.makeConstraints {
            $0.height.equalTo(firstYellowView.snp.width)
        }
        
        secondYellowView.snp.makeConstraints {
            $0.height.equalTo(secondYellowView.snp.width)
        }
        
        firstGreenView.snp.makeConstraints {
            $0.width.equalTo(firstYellowView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(firstYellowView.snp.height).multipliedBy(0.5)
            $0.centerX.centerY.equalTo(firstYellowView)
        }
        
        secondGreenView.snp.makeConstraints {
            $0.width.equalTo(secondYellowView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(secondYellowView.snp.height).multipliedBy(0.5)
            $0.trailing.equalTo(secondYellowView.snp.trailing).offset(-10)
            $0.top.equalTo(secondYellowView.snp.top).offset(10)
        }
        
        firstBtn.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom).offset(10)
            $0.leading.equalTo(redView.snp.leading).offset(10)
            $0.trailing.equalTo(redView.snp.trailing).offset(-10)
        }
        
        fourthBtn.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.top.equalTo(buttonStackView.snp.bottom).offset(10)
            $0.leading.equalTo(redView.snp.leading).offset(10)
            $0.trailing.equalTo(redView.snp.trailing).offset(-10)
        }
        
        horizontalStackView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.top).offset(10)
            $0.leading.equalTo(blueView.snp.leading).offset(10)
            $0.trailing.equalTo(blueView.snp.trailing).offset(-10)
            $0.bottom.equalTo(blueView.snp.bottom).offset(-10)
        }
        
        pinkView.snp.makeConstraints {
            $0.height.equalTo(horizontalStackView.snp.height)
        }
        
    }

}
