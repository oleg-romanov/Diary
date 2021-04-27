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

    var eventNameLabel: UILabel = UILabel()
    var eventDateLabel: UILabel = UILabel()
    var eventTimeLabel: UILabel = UILabel()
    var eventDiscription: UILabel = UILabel()

    init() {
        super.init(frame: UIScreen.main.bounds)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .yellow
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        
    }

    private func addSubviews() {
        addSubview(eventNameLabel)
        addSubview(eventDateLabel)
        addSubview(eventTimeLabel)
        addSubview(eventDiscription)
    }

    private func makeConstraints() {

    }
}
