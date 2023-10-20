//
//  ViewController.swift
//  MVVMEX2
//
//  Created by coco on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    let viewModel = ViewModel()
    var currentDateTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.reload()
        viewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.mainLabel.text = self?.viewModel.datetimeString
            }
        }
    }

    @IBAction func todayButtonClicked(_ sender: UIButton) {
        mainLabel.text = "..."
        viewModel.reload()
    }
    
    @IBAction func yesterdayButtonClicked(_ sender: UIButton) {
        viewModel.moveDay(day: -1)
    }
    
    @IBAction func tomorrowButtonClicked(_ sender: UIButton) {
        viewModel.moveDay(day: 1)
    }
}
