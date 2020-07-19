//
//  LaunchViewController.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

  let launchImage = UIImageView()
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setView()
      constrain()
      
  }
    
  func setView(){
    
    launchImage.image = UIImage(named: "blue")
    view.addSubview(launchImage)
    
  }
  
  
  func constrain(){
    
    launchImage.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      launchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
      launchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
      launchImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
      launchImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

    ])
      
    
  }

}
