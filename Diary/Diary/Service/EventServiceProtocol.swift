//
//  EventServiceProtocol.swift
//  Diary
//
//  Created by Олег Романов on 4/26/21.
//

import Foundation

protocol EventService {
    func findByDay(date: Date, completion: (Result<[Event], Error>) -> Void)
}
