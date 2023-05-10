//
//  ViewController.swift
//  SnapKitEx
//
//  Created by coco on 2023/05/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // 사용할 View
    let redView = UIView()
    let orangeView = UIView()
    let yellowView = UIView()
    let greenView = UIView()
    let horizontalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        initSetup()
        addSubView()
        setConstraints()
        
    }
    
    /// 컴포넌트 UI초기설정 함수
    func initSetup() {
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 10
    }
    
    /// 상위뷰에 하위뷰 추가
    func addSubView() {
        view.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(redView)
        horizontalStackView.addArrangedSubview(orangeView)
        horizontalStackView.addArrangedSubview(yellowView)
        view.addSubview(greenView)
    }
    
    /// 제약조건 설정 함수
    func setConstraints() {
        // 모든 view height 30, 간격 10
        let safeArea = view.safeAreaLayoutGuide
        let height = 300
        horizontalStackView.snp.makeConstraints {
            $0.height.equalTo(height - 5)
            $0.top.equalTo(safeArea.snp.top).offset(10)
            $0.leading.equalTo(safeArea.snp.leading).offset(10)
            $0.trailing.equalTo(safeArea.snp.trailing).offset(-10)
        }
        
        redView.snp.makeConstraints {
            $0.height.equalTo(height)
//            $0.width.equalTo(horizontalStackView.snp.width).multipliedBy(0.3)
        }
    
        orangeView.snp.makeConstraints {
            $0.height.equalTo(redView.snp.height).multipliedBy(0.5)
        }

        yellowView.snp.makeConstraints {
            $0.height.equalTo(orangeView.snp.height).multipliedBy(0.5)
        }

        greenView.snp.makeConstraints {
            $0.height.equalTo(height / 2 - 10)
            $0.top.equalTo(orangeView.snp.bottom).offset(10)
            $0.leading.equalTo(redView.snp.trailing).offset(10)
            $0.trailing.equalTo(safeArea.snp.trailing).offset(-10)
            
        }
    }
}

