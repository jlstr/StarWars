//
//  AppDelegate.swift
//  StarWars
//
//  Created by jose on 11/25/18.
//  Copyright © 2018 jose. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow()
    
    if let window = self.window {
      window.makeKeyAndVisible()
      window.rootViewController = UINavigationController(rootViewController: CharactersViewController())
    }
    
    return true
  }
}

