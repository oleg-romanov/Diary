//
//  AppDelegate.swift
//  Diary
//
//  Created by Олег Романов on 4/25/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TaskListController")
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }

}

