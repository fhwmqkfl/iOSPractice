//
//  Observable.swift
//  MVVMEX
//
//  Created by coco on 2023/09/21.
//

import Foundation

// 변화를 관찰하며 동작
class Observable<T> {
    var listener: ((T?) -> Void)?
    
    // value가 변하면 didSet에 의해 변경된 value의 값을 갖고 listner동작실행
    // Timer가 매초 실행되기때문에 매초 반복실행됨
    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    // 클로저 안쪽의 동작(ObservablesTimeLabel을 업데이트) lister에 저장함
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
