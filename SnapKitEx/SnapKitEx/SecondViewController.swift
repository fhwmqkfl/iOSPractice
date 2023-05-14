//
//  SecondViewController.swift
//  SnapKitEx
//
//  Created by coco on 2023/05/14.
//

import UIKit
import SnapKit

/*
 3) 파란뷰 내부 띄우기
 4) 노란뷰 내부 띄우기
 */

class SecondViewController: UIViewController {
    let redView = UIView()
    let blueView = UIView()
    let pinkView = UIView()
    
    // 하단 부분
    let leftYellowView = UIView()
    let rightYellowView = UIView()
    
    let leftGreenView = UIView()
    let rightGreenView = UIView()
    
    // 하단 leftYellowView,rightYellowView를 담는 StackView
    let yellowHStackView = UIStackView()
    
    let redInnerVStackView = UIStackView()
    
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    let buttonHStackView = UIStackView()
    
    // blueView내부 요소 정렬 StackView(horizontal)
    let blueInnerHStackView = UIStackView()
    
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let fourthLabel = UILabel()
    let labelVStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initSetup()
        addSubview()
        setupConstraints()
        
    }
    
    func initSetup() {
        redView.backgroundColor = .systemRed
        blueView.backgroundColor = .systemBlue
        pinkView.backgroundColor = .systemPink
        
        leftYellowView.backgroundColor = .systemYellow
        rightYellowView.backgroundColor = .systemYellow
        
        leftGreenView.backgroundColor = .systemGreen
        rightGreenView.backgroundColor = .systemGreen
        
        yellowHStackView.axis = .horizontal
        redInnerVStackView.axis = .vertical
        buttonHStackView.axis = .horizontal
        blueInnerHStackView.axis = .horizontal
        labelVStackView.axis = .vertical
        
        yellowHStackView.spacing = 10
        redInnerVStackView.spacing = 10
        buttonHStackView.spacing = 10
        blueInnerHStackView.spacing = 10
        labelVStackView.spacing = 10
        
        buttonHStackView.distribution = .fillEqually
        labelVStackView.distribution = .fillProportionally
        
        // blueInnerHStackView의 alignment수정
        blueInnerHStackView.alignment = .top

        
        firstButton.setTitleColor(.black, for: .normal)
        secondButton.setTitleColor(.black, for: .normal)
        thirdButton.setTitleColor(.black, for: .normal)
        fourthButton.setTitleColor(.black, for: .normal)
        
        firstButton.backgroundColor = .white
        secondButton.backgroundColor = .white
        thirdButton.backgroundColor = .white
        fourthButton.backgroundColor = .white

        firstButton.setTitle("버튼1", for: .normal)
        secondButton.setTitle("버튼2", for: .normal)
        thirdButton.setTitle("버튼3", for: .normal)
        fourthButton.setTitle("버튼3", for: .normal)
        
        firstLabel.text = "이것은 Label1 입니다."
        secondLabel.text = "이것은 Label2 입니다."
        thirdLabel.text = "이것은 Label3 입니다."
        fourthLabel.text = "이것은 Label4 입니다."
        
        firstLabel.backgroundColor = .white
        secondLabel.backgroundColor = .white
        thirdLabel.backgroundColor = .white
        fourthLabel.backgroundColor = .white

    }
    
    func addSubview() {
        view.addSubview(redView)
        
        leftYellowView.addSubview(leftGreenView)
        rightYellowView.addSubview(rightGreenView)
        yellowHStackView.addArrangedSubview(leftYellowView)
        yellowHStackView.addArrangedSubview(rightYellowView)
        view.addSubview(yellowHStackView)
        
        buttonHStackView.addArrangedSubview(firstButton)
        buttonHStackView.addArrangedSubview(secondButton)
        buttonHStackView.addArrangedSubview(thirdButton)
        view.addSubview(buttonHStackView)
        
        labelVStackView.addArrangedSubview(firstLabel)
        labelVStackView.addArrangedSubview(secondLabel)
        labelVStackView.addArrangedSubview(thirdLabel)
        labelVStackView.addArrangedSubview(fourthLabel)
        
        blueInnerHStackView.addArrangedSubview(pinkView)
        blueInnerHStackView.addArrangedSubview(labelVStackView)
        blueView.addSubview(blueInnerHStackView)
        
        redInnerVStackView.addArrangedSubview(blueView)
        redInnerVStackView.addArrangedSubview(buttonHStackView)
        redInnerVStackView.addArrangedSubview(fourthButton)
        view.addSubview(redInnerVStackView)
        
        
    }
    
    func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        redView.snp.makeConstraints {
            $0.leading.equalTo(safeArea).offset(10)
            $0.top.equalTo(safeArea).offset(10)
            $0.trailing.equalTo(safeArea).offset(-10)
            $0.height.equalTo(redView.snp.width).multipliedBy(1)
        }
        
        yellowHStackView.snp.makeConstraints {
            $0.leading.equalTo(safeArea).offset(10)
            $0.top.equalTo(redView.snp.bottom).offset(10)
            $0.trailing.equalTo(safeArea).offset(-10)
        }
        leftYellowView.snp.makeConstraints {
            $0.height.equalTo(leftYellowView.snp.width)
        }

        rightYellowView.snp.makeConstraints {
            $0.height.equalTo(rightYellowView.snp.width)
        }
        
        redInnerVStackView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.top).offset(10)
            $0.leading.equalTo(redView.snp.leading).offset(10)
            $0.trailing.equalTo(redView.snp.trailing).offset(-10)
        }
        
        blueInnerHStackView.snp.makeConstraints {
            $0.leading.equalTo(blueView.snp.leading).offset(10)
            $0.top.equalTo(blueView.snp.top).offset(10)
            $0.bottom.equalTo(blueView.snp.bottom).offset(-10)
            $0.trailing.equalTo(blueView.snp.trailing).offset(-10)
        }
        
        pinkView.snp.makeConstraints {
            $0.height.equalTo(pinkView.snp.width).multipliedBy(1)
        }
        
        leftGreenView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(leftYellowView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(leftGreenView.snp.width)
        }
        
        rightGreenView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.width.equalTo(rightYellowView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(rightGreenView.snp.width)
        }
    }

}
