//
//  ClockViewModel.swift
//  MVVMEX
//
//  Created by coco on 2023/09/21.
//

import Foundation

class ClockViewModel {
    // 수행할 동작을 담을 클로저 변수 생성
    var didChangeTime: ((ClockViewModel) -> Void)?
    // 매초 시간마다 업데이트 되고 didChangeTime가 호출될 예정
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    // 초기화 시점에서 현재 시간을 넣어줌
    init() {
        closureTime = Clock.currentTime()
    }
    
    // 매 초마다 호출될 예정 -> closureTime에 시간을 넣어줌
    func checkTime() {
        closureTime = Clock.currentTime()
    }
}
