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
    }

    
}
