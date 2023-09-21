//
//  ViewController.swift
//  MVVMEX
//
//  Created by coco on 2023/09/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var ObservablesTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 매 초마다 업데이트
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
        }
    }
}

