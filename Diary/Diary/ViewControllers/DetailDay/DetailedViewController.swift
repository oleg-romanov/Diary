//
//  DetailedViewController.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

class DetailedViewController: UIViewController {

    lazy var customView: DetailedView = DetailedView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        navigationItem.leftBarButtonItem = customView.backButton
        addActionHandlers()
    }

    private func addActionHandlers() {
        customView.backButton.target = self
        customView.backButton.action = #selector(backButtonTapped)
    }

    @objc private func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
