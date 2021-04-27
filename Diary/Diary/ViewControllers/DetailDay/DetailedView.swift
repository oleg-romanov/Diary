//
//  DetailedView.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit
import SnapKit

class DetailedView: UIView {

    //MARK:- Properties

    private var eventNameLabel: UILabel = UILabel()
    private var eventDateLabel: UILabel = UILabel()
    private var eventTimeLabel: UILabel = UILabel()
    private var eventDiscription: UILabel = UILabel()
    lazy var backButton: UIBarButtonItem = UIBarButtonItem(
            title: "Назад",
            style: .plain,
            target: nil,
            action: nil
        )

    private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = .none
        dateFormatter.locale = Locale(identifier: "ru")
        return dateFormatter
    } ()

    init() {
        super.init(frame: UIScreen.main.bounds)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(eventNameLabel)
        addSubview(eventDateLabel)
        addSubview(eventTimeLabel)
        addSubview(eventDiscription)
    }

    private func makeConstraints() {
        eventNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        eventDateLabel.snp.makeConstraints { make in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        eventDiscription.snp.makeConstraints { make in
            make.top.equalTo(eventDateLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
    }

    func configure(event: Event) {
        eventNameLabel.text = event.name
        eventDateLabel.text = dateFormatter.string(from: event.date)
        eventDiscription.text = event.descripton
    }
}
