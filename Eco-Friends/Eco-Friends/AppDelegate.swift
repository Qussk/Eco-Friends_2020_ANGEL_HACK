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
//
//    let homeNavi = UINavigationController(rootViewController: HomeViewController())
//    let searchNavi = UINavigationController(rootViewController: SearchViewController())
//    let descriptionNavi = UINavigationController(rootViewController: DescriptionViewController())
    let addressNavi = UINavigationController(rootViewController: AddressViewController())
//    let myPageNavi = UINavigationController(rootViewController: MyPageViewController())
//    let tabVC = UITabBarController()
//    tabVC.viewControllers = [homeNavi, searchNavi, descriptionNavi, myPageNavi]
//
//    homeNavi.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
//    searchNavi.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
//    descriptionNavi.tabBarItem = UITabBarItem(title: "기업 소개", image: UIImage(systemName: "globe"), tag: 2)
//    myPageNavi.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person"), tag: 3)
//
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = addressNavi
    window?.backgroundColor = .systemBackground
    window?.makeKeyAndVisible()
    
    return true
  }
}

