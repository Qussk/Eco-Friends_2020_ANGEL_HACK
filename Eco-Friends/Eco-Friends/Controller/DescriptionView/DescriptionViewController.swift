//
//  DescriptionViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
  
  //라벨
  let descriptionTitle = UILabel()
  let descriptionLable = UILabel()
  
  //frame: CGRect(x: 0, y: 0, width: 320, height: 430)
  //스크롤뷰
  lazy var scrollView = UIScrollView()
  var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
  let images = ["naver","instagram","naver"]
  
  //페이지뷰
  lazy var pageControl = UIPageControl(frame: CGRect(x: view.frame.midX - 100, y: view.frame.maxY - 200, width: 200, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "친환경 기업"
    
    setupView()
    setipConstrain()
    setScrollView()
    pageControl()
    
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
    
    scrollView.contentSize = CGSize(width: 375 * 3, height: scrollView.frame.height)
    // scrollView.delegate = self
    scrollView.isPagingEnabled = true
    scrollView.backgroundColor = .red
    view.addSubview(scrollView)
    
  }
  
   func navigationLess(){
  //네비게이션바 디자인 생략
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  //MARK:-setipConstrain
  func setipConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    [descriptionTitle,descriptionLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 34).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor,constant: -34).isActive = true
      
    }
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      descriptionTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 18),
      
      descriptionLable.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 16),
      
      scrollView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 39),
      scrollView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
//     scrollView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      scrollView.widthAnchor.constraint(equalToConstant: 375),
      scrollView.heightAnchor.constraint(equalToConstant: 430)
      
    ])
  }
  
  func setScrollView(){
//
    for index in images.indices {
    scrollFrame.origin.x = view.frame.width * CGFloat(index)
    scrollFrame.size = scrollView.frame.size
     
      
    let descriptionImage = UIImageView()
      descriptionImage.image = UIImage(named: images[index])
      descriptionImage.frame = CGRect(x: scrollFrame.origin.x, y: 0, width: 375, height: 430)
      scrollView.addSubview(descriptionImage)
  
  }
    
    
    func pageControl(){
      
    }
    
    
  }


func animated(){
  UIView.animate(withDuration: 0.2, animations: {

    
  })
  
}
}
