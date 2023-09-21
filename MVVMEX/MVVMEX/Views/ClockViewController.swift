//
//  ClockViewController.swift
//  MVVMEX
//
//  Created by coco on 2023/09/21.
//

import UIKit

class ClockViewController: UIViewController {
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var ObservablesTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    // 뷰모델 생성
    let clockViewModel = ClockViewModel()
    
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
    }
}
