//
//  DetaileDescriotionViewController.swift
//  Eco-Friends
//
//  Created by Qussk_MAC on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class DetaileDescriotionViewController: UIViewController {

  let detailimageView = UIImageView()
  let detailTitle = UILabel()
  let detailLable = UILabel()
  
  let detailView = UIView()
  let logoIamge = UIImageView()
  let detailTextView = UITextView()
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      setView()
      setConstrain()
    }
    
  //MARK:- UI
  func setView(){
    
    
    detailimageView.image = UIImage(named: "4")
    view.addSubview(detailimageView)
    
    detailTitle.text = "로티스"
    detailTitle.textColor = .white
    detailTitle.font = UIFont.systemFont(ofSize: 16)
    detailimageView.addSubview(detailTitle)
    
    detailLable.text = "페트병으로 만드는\n패션아이템"
    detailLable.textColor = .white
    detailLable.font = UIFont.boldSystemFont(ofSize: 28)
    detailimageView.addSubview(detailLable)
    
    detailView.backgroundColor = .white
    detailView.layer.cornerRadius = view.frame.width/17
    view.addSubview(detailView)
    
    logoIamge.image = UIImage(named: "instagram")
    detailView.addSubview(logoIamge)
    
    detailTextView.text = "돈을 모으는 것도 중요하지만 잘 쓰는 것도 중요하다. 잘 쓰는 것도 중요하다. 돈을 벌어도 소소하게 새어 나가는 돈이 많으면 모이지 않는다. 우선 집안을 정리해보자. 그동안 어디에 돈을 썼고, 잘못 산 물건은 무엇인지 알게 된다. 가령 옷장은 터지는데 입을 옷이 없다면 충동구매가 잦아서다. 허한 마음을 채우기 위해 쓰는 돈만큼 아까운게 없다. 재태크를 하기 전 먼저 새어 나가 돈을 잡는 데 집중해야 한다. 필수품과 사치품, 물품별로 즐겨사용하는 브랜드를 적어두는 것도 큰 도움이 된다. 예를 들어 A샴푸가 내게 맞다면 이걸 사용하면 된다. 광고에 현혹되거나 충동구매로 다른 샴푸를 샀는데 별로였다면 사용하지 않고 묵혀두기 쉽상이다. 주변부터 정리하고 현명하게 소비하라는 뜻이다."
    detailTextView.font = UIFont.systemFont(ofSize: 16)
    detailTextView.textColor = ColorPiker.customGray
    detailView.addSubview(detailTextView)
    
    
    
    detailTextView.showsVerticalScrollIndicator = false
    detailTextView.showsHorizontalScrollIndicator = false
    
  }
  
  func setConstrain(){
    let guide = view.safeAreaLayoutGuide
    
    [detailTitle,detailLable,detailTextView].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
      $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    detailimageView.translatesAutoresizingMaskIntoConstraints = false
    detailView.translatesAutoresizingMaskIntoConstraints = false
    logoIamge.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([

      detailimageView.topAnchor.constraint(equalTo: view.topAnchor),
      detailimageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      detailimageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      detailimageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
      
      detailTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 80),
      
      detailLable.topAnchor.constraint(equalTo: detailTitle.bottomAnchor, constant: 8),
      
      detailView.topAnchor.constraint(equalTo: detailimageView.bottomAnchor, constant: -41),
      detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
     
      logoIamge.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 41),
      logoIamge.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
      logoIamge.widthAnchor.constraint(equalToConstant: 90),
      logoIamge.heightAnchor.constraint(equalToConstant: 30),
      
      detailTextView.topAnchor.constraint(equalTo: logoIamge.bottomAnchor, constant: 26),
      detailTextView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor, constant: -26)
      
    ])
    
    
    
  }



}
