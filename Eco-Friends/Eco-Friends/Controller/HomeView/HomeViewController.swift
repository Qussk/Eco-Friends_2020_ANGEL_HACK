//
//  HomeViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
  
  //MARK: -  Properties
  let mapView = MKMapView()
  private let myPlace = MKPointAnnotation()
  private let orderChildVC = OrderViewController()
  let naviTitleButton = UIButton(type: .system)
  
  
  //MARK: - viewDidLoad()
  override func viewDidLoad() {
    super.viewDidLoad()
 
    setUI()
    setConstraint()
    setNavigation()
    setMyPlace()
  }
  
  //MARK: - setUI()
  private func setUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(mapView)
    
    addChild(orderChildVC)
    view.addSubview(orderChildVC.view)
    orderChildVC.didMove(toParent: self)
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
//    let guide = view.safeAreaLayoutGuide
    
    [mapView, orderChildVC.view].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: view.topAnchor),
      mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mapView.heightAnchor.constraint(equalToConstant: 300),
      
      orderChildVC.view.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -25),
      orderChildVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      orderChildVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      orderChildVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
    ])
  }
  
  //MARK: - setNavigation()
  
  private func setNavigation() {
<<<<<<< HEAD
    navigationItem.titleView = naviTitleButton
    naviTitleButton.backgroundColor = .clear
    naviTitleButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    naviTitleButton.semanticContentAttribute = .forceRightToLeft
    naviTitleButton.tintColor = .black
    naviTitleButton.setTitle("성수동 성수이로 108", for: .normal)
    naviTitleButton.setTitleColor(.black, for: .normal)
    naviTitleButton.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 40))
=======
    navigationController?.isNavigationBarHidden = true
//    navigationItem.titleView = naviTitleButton
//    naviTitleButton.backgroundColor = .clear
//    naviTitleButton.setTitle("성수동 성수이로 108", for: .normal)
//    naviTitleButton.setTitleColor(.black, for: .normal)
//    naviTitleButton.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 40))
>>>>>>> 76f09aa8017398765776226b777f2db5ea4f0536
  }
  
  
  
  private func setMyPlace() {
    myPlace.coordinate = CLLocationCoordinate2D(latitude: 37.541708, longitude: 127.056256)
    myPlace.title = "우리집"
    mapView.addAnnotation(myPlace)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    let region = MKCoordinateRegion(center: myPlace.coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  

}
