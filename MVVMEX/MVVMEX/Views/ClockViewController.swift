//
//  ClockViewController.swift
//  MVVMEX
//
//  Created by coco on 2023/09/21.
//

import Combine
import UIKit

class ClockViewController: UIViewController {
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var ObservablesTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    // 뷰모델 생성
    let clockViewModel = ClockViewModel()
    // 메모리관리를 위해 자동취소 AnyCancellable 만들어줌
    // VC deinit시 cancel()실행
    private var cancelables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closureTimeLabel.text = clockViewModel.closureTime
        setBindings()
        startTimer()
    }
    
    // 매 초마다 업데이트
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in 
            self.clockViewModel.checkTime()
        }
    }
    
    func setBindings() {
        clockViewModel.didChangeTime = { [weak self] clockViewModel in
            self?.closureTimeLabel.text = clockViewModel.closureTime
        }
        
        clockViewModel.observableTIme.bind { [weak self] time in
            self?.ObservablesTimeLabel.text = time
        }
        
        clockViewModel.$combineTime
            .compactMap { String($0) } // 옵셔널 제거작업(Published<String>)
            .assign(to: \.text, on: combineTimeLabel) // combineTimeLabel의 텍스트 접근
            .store(in: &cancelables) // 취소할 동작을 Set에 저장
    }
}
