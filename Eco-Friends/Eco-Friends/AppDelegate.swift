//
//  AppDelegate.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/16.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   
    let addressNavi = UINavigationController.init(rootViewController: AddressViewController())
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = addressNavi
    window?.makeKeyAndVisible()
    
    
    return true
  }
}

