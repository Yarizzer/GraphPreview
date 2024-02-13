//
//  AppDelegate.swift
//  GraphPreview
//
//  Created by Yaroslav Abaturov on 12.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var router: AppRoutable?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.router = AppRouter()
        
        self.router?.routeToInitialScene()
        
        return true
    }
}
