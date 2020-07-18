//
//  GuideCollectionViewCell.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "GuideCollectionViewCell"
  
  let check = UIButton()
  let imgV = UIImageView()
  let titleLabel = UILabel()
  let subLabel = UILabel()
  
  let singleton = SingletonClass.shared.arrData
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    contentView.backgroundColor = .systemGray5
    contentView.layer.cornerRadius = 10
    [check, imgV, titleLabel, subLabel].forEach { contentView.addSubview($0) }
    
    titleLabel.font = .boldSystemFont(ofSize: 25)
    
    check.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    check.tintColor = .black
    
    imgV.layer.cornerRadius = 10
    
  }
  
  func setConstraint() {
    
    [check, imgV, titleLabel, subLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
//      contentView.topAnchor.constraint(equalTo: self.topAnchor),
//      contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//      contentView.widthAnchor.constraint(equalToConstant: 339),
//      contentView.heightAnchor.constraint(equalToConstant: 100),
      
      imgV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      imgV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      imgV.widthAnchor.constraint(equalToConstant: 80),
      imgV.heightAnchor.constraint(equalToConstant: 80),
      
      titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
      titleLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 16),
      titleLabel.heightAnchor.constraint(equalToConstant: 18),
      
      subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      subLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 16),
      subLabel.heightAnchor.constraint(equalToConstant: 13),
      
      check.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43.21),
      check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      check.widthAnchor.constraint(equalToConstant: 8),
      check.heightAnchor.constraint(equalToConstant: 13.5)
    ])
  }
  
  func configure(data: [String: Any]) {
    if SingletonClass.shared.arrData.isEmpty == true {
      imgV.backgroundColor = .systemGray
      titleLabel.text = "쓸애기"
      subLabel.text = "쓸애기"
    } else {
      let img = data["카테고리"] as? String ?? "없음"
      let subText = data["재활용 종류"] as? String ?? "없음"
      let titleText = data["품목"] as? String ?? "없음"
      
      imgV.image = UIImage(named: img)
      titleLabel.text = titleText
      subLabel.text = subText
    }
  }
}
