//
//  Event.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

struct Event: Codable {
    var id: Int
    var date: Date
    var name: String
    var descripton: String
}
