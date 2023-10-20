//
//  ViewModel.swift
//  MVVMEX2
//
//  Created by coco on 2023/10/20.
//

import Foundation

class ViewModel {
    
    var onUpdated: () -> Void = {}
    var datetimeString: String = "Loading..." {
        didSet {
            onUpdated()
        }
    }
    var currentModel = Model(currentDateTIme: Date())
    
    
    // 어제, 내일 날짜 계산
    func moveDay(day: Int) {
        calculateDate(day: day)
        datetimeString = dateToString(date: currentModel.currentDateTIme)
    }
    
    func calculateDate(day: Int) {
        guard let movedDay = Calendar.current.date(byAdding: .day, value: day, to: currentModel.currentDateTIme) else { return }
        currentModel.currentDateTIme = movedDay
    }
    
    // 오늘 날짜 계산
    func fetchNow(onCompleted: @escaping (Model) -> Void) {
        let url = "http://worldtimeapi.org/api/timezone/Asia/Tokyo"

        URLSession.shared.dataTask(with: URL(string: url)!) { [weak self] data, _, _ in
            guard let data = data else { return }
            guard let entity = try? JSONDecoder().decode(UtcTimeModel.self, from: data) else { return }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"

            guard let now = formatter.date(from: entity.currentDateTime) else { return }

            let model = Model(currentDateTIme: now)
            self?.currentModel = model
            onCompleted(model)
            print("HOHO")
        }.resume()
    }
    
    func reload() {
        fetchNow { [weak self] model in
            guard let self = self else { return }
            let dateString = self.dateToString(date: model.currentDateTIme)
            self.datetimeString = dateString
        }
    }
    
    // 날짜 변환
    func dateToString( date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return formatter.string(from: date)
    }
}
