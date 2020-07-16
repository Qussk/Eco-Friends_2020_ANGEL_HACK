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
  private let mapView = MKMapView()
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
    let guide = view.safeAreaLayoutGuide
    
    [mapView, orderChildVC.view].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      mapView.topAnchor.constraint(equalTo: guide.topAnchor),
      mapView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      mapView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.4),
      
      orderChildVC.view.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -25),
      orderChildVC.view.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      orderChildVC.view.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      orderChildVC.view.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
  
  //MARK: - setNavigation()
  
  private func setNavigation() {
    navigationItem.titleView = naviTitleButton
    naviTitleButton.backgroundColor = .clear
    naviTitleButton.setTitle("성수동 성수이로 108", for: .normal)
    naviTitleButton.setTitleColor(.black, for: .normal)
    naviTitleButton.frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 40))
  }
  
  private func setMyPlace() {
    myPlace.coordinate = CLLocationCoordinate2D(latitude: 37.541708, longitude: 127.056256)
    myPlace.title = "우리집"
    mapView.addAnnotation(myPlace)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
    let region = MKCoordinateRegion(center: myPlace.coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  

}
