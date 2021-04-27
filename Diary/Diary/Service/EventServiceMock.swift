//
//  EventServiceMock.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

class EventServiceMock: EventService {
    var data: [Event] = []

    init() {
        var counter: Int = 0
        for _ in 0...100 {
            var name: String
            var description: String
            if Bool.random() {
                name = "Позавтракать"
                description = "Завтрак съешь сам"
            } else if Bool.random() {
                name = "Пообедать"
                description = "Обед раздели с товарищем"
            } else if Bool.random() {
                name = "Ужин"
                description = "Ужин оставь врагу"
            } else if Bool.random() {
                name = "Уборка"
                description = "Убраться на рабочем столе"
            } else {
                name = "Прогулка"
                description = "Подышать свежим воздухом"
            }

            let event = Event(id: counter, date: Date().addingTimeInterval(TimeInterval.random(in: 0...341_234)), name: name, descripton: description)
            counter += 1
            data.append(event)
        }
    }

    func findByDay(date: Date, completion: (Result<[Event], Error>) -> Void) {
        completion(.success(data.filter { item in
            Calendar.current.isDate(item.date, inSameDayAs: date)
        }))
    }
}
