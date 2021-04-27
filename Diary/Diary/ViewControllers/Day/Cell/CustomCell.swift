//
//  CustomCell.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var eventLabel: UILabel!

    func configure(event: Event?) {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ru")
        if let date = event?.date {
            dateLabel?.text = formatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
        eventLabel?.text = event?.name
    }

    func configureVoidCell() {

    }
}
