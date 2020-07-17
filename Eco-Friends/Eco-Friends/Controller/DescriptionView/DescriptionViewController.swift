//
//  DescriptionViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
  
  
  let descriptionTitle = UILabel()
  let descriptionLable = UILabel()
  
  lazy var scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 20, height: view.frame.height-100))
  var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
  let images = ["naver","instagram"]
  
  lazy var pageControl = UIPageControl(frame: CGRect(x: view.frame.midX - 100, y: view.frame.maxY - 200, width: 200, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "친환경 기업"
    
    setupView()
    setipConstrain()
    setScrollView()

  }
  
  //MARK:- UI
  func setupView(){
    
    descriptionTitle.text = "환경을 살리는\n기업을 알아보세요."
    descriptionTitle.numberOfLines = 2
    descriptionTitle.font = UIFont(name: "PingFangHK-Light", size: 25)
    view.addSubview(descriptionTitle)
    
    descriptionLable.text = "우리의 노력으로 새로운"
    descriptionLable.font = UIFont.systemFont(ofSize: 14)
    descriptionLable.textColor = ColorPiker.customGray
    view.addSubview(descriptionLable)
    
  }
  func setipConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    [descriptionTitle,descriptionLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 34).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor,constant: -34).isActive = true
      
    }
    
    NSLayoutConstraint.activate([
      descriptionTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 18),
      
      descriptionLable.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 16),
      
      
      
    ])
  }
  
  func setScrollView(){
    
  }
  
  
}
