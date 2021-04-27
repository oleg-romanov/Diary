//
//  DatesViewCell.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

class DatesViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
       didSet {
            if self.isSelected {
                dayOfMonthLabel.textColor = .blue
                dayOfWeekLabel.textColor = .blue
            } else {
                dayOfMonthLabel.textColor = UIColor.black
                dayOfWeekLabel.textColor = UIColor.black
            }
        }
    }
    
    var isToday: Bool = false {
        didSet {
            if self.isToday {
                dayOfMonthLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
                dayOfWeekLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
            } else {
                dayOfMonthLabel.font = UIFont.systemFont(ofSize: 20)
                dayOfWeekLabel.font = UIFont.systemFont(ofSize: 10)
            }
        }
    }
    
    var date: Date? {
        didSet {
            guard let date = self.date else {  return  }
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents(in: .current, from: date)
            
            dayOfMonthLabel.text = String(components.day ?? 0)
            let weekdayInt = components.weekday ?? 1
            var weekday: String?
            if weekdayInt == 2 {
                weekday = "ПОН"
            } else if weekdayInt == 3 {
                weekday = "ВТО"
            } else if weekdayInt == 4 {
                weekday = "СРЕ"
            } else if weekdayInt == 5 {
                weekday = "ЧЕТ"
            } else if weekdayInt == 6 {
                weekday = "ПЯТ"
            } else if weekdayInt == 7 {
                weekday = "СУБ"
            } else if weekdayInt == 1 {
                weekday = "ВОС"
            }
            dayOfWeekLabel.text = weekday
        }
    }
    
    var dayOfWeekLabel: UILabel!
    var dayOfMonthLabel: UILabel!
    
    override func prepareForReuse() {
        dayOfMonthLabel.textColor = UIColor.black
        dayOfWeekLabel.textColor = UIColor.black
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        dayOfWeekLabel = UILabel()
        dayOfWeekLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfWeekLabel.font = UIFont.systemFont(ofSize: 10)
        
        dayOfMonthLabel = UILabel()
        dayOfMonthLabel.translatesAutoresizingMaskIntoConstraints = false
        dayOfMonthLabel.font = UIFont.systemFont(ofSize: 20)
        
        self.addSubview(dayOfWeekLabel)
        self.addSubview(dayOfMonthLabel)
        
        updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.removeConstraints(self.constraints)
        
        self.dayOfWeekLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        self.dayOfWeekLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true

        self.dayOfMonthLabel.topAnchor.constraint(equalTo: dayOfWeekLabel.bottomAnchor, constant: 4).isActive = true
        self.dayOfMonthLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
