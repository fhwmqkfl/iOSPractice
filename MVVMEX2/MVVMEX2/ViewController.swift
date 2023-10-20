//
//  ViewController.swift
//  MVVMEX2
//
//  Created by coco on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var currentDateTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNow()
    }
    
    private func fetchNow() {
        let url = "http://worldtimeapi.org/api/timezone/Asia/Tokyo"
        
        mainLabel.text = "loading..."

        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let model = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
            
            guard let now = formatter.date(from: model.currentDateTime) else { return }
            
            self?.currentDateTime = now
            
            DispatchQueue.main.async {
                self?.updateDateTime()
            }
        }.resume()
    }
    
    func updateDateTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        mainLabel.text = formatter.string(from: currentDateTime)
    }

    @IBAction func todayButtonClicked(_ sender: UIButton) {
        fetchNow()
    }
    
    @IBAction func yesterdayButtonClicked(_ sender: UIButton) {
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: currentDateTime) else { return }
        
        currentDateTime = yesterday
        updateDateTime()
    }
    
    @IBAction func tomorrowButtonClicked(_ sender: UIButton) {
        guard let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: currentDateTime) else { return }
        
        currentDateTime = tomorrow
        updateDateTime()
    }
}
