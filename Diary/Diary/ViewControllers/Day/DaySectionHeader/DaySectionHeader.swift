//
//  DaySectionHeader.swift
//  Diary
//
//  Created by Олег Романов on 4/27/21.
//

import UIKit
import SnapKit

class DaySectionHeader: UICollectionReusableView {
    static let identifier = "DaySectionHeader"

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    } ()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = .none
        dateFormatter.locale = Locale(identifier: "ru")
        return dateFormatter
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(headerLabel)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(30)
        }
    }

    func configure(time: Date) {
        let timeAndHour = time.addingTimeInterval(3600)
        headerLabel.text = "\(dateFormatter.string(from: time)) - \(dateFormatter.string(from: timeAndHour))"
    }
}
