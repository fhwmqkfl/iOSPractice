//
//  File.swift
//  NotificationEX
//
//  Created by coco on 2023/09/10.
//

import Foundation


//let selectedIndexHandler: ((Int) -> Void)
//    
//    init(tagSelectionHandler: @escaping ((Int) -> Void)) {
//        self.selectedIndexHandler = tagSelectionHandler
//    }
//let tagVM = TagViewModel(tagSelectionHandler: selectedIndexHandler)
//
//// ---
//final class PublishRelay<T> {
//    typealias BindElement = (T) -> Void
//    
//    private var binders: [BindElement] = []
//    
//    func bind(onNext: @escaping BindElement) {
//        //클로저 등록 (특정 이벤트가 발생했을 때 어떤 동작을 할 것인지에 대한 클로저를 미리 등록)
//        binders.append(onNext)
//    }
//    
//    func accept(_ value: T) { // 이벤트 발생시킴
//        binders.forEach {
//            $0(value)
//        }
//    }
//    
//    func clearBinds() {
//        binders.removeAll()
//    }
//}
//// ---
//
//pushButton.addAction(UIAction(handler: { [weak self] _ in
//            self?.viewModel.input.pushButtonDidTap.accept(())
//        }), for: .touchUpInside)
//        
//        viewModel.output.changeLabelText
//            .bind { [weak self] changedLabelText in
//                self?.someLabel.text = changedLabelText
//            }
//// ---
//final class SearchHomeViewModel {
//    
//    struct Input {
//        let pushButtonDidTap = PublishRelay<Void>()
//    }
//    
//    struct Output {
//        let changeLabelText = PublishRelay<String>()
//    }
//    
//    
//    let input = Input()
//    let output = Output()
//    
//    init() {
//        input.pushButtonDidTap.bind { [weak self] _ in
////            print("asd")
//            self?.output.changeLabelText.accept("바뀐 텍스트")
//        }
//        
//        
//    }
//}
