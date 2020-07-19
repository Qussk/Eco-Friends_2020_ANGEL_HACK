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
  
  let coverBtn = UIButton()
  let check = UIButton()
  
  let imgV = UIImageView()
  let titleLabel = UILabel()
  
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
    contentView.addSubview(coverBtn)
    coverBtn.layer.cornerRadius = 10
    [check, imgV, titleLabel].forEach { coverBtn.addSubview($0) }
    
    titleLabel.font = .boldSystemFont(ofSize: 25)
    
    check.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    check.tintColor = .black
    
    imgV.layer.cornerRadius = 10
    
  }
  
  func setConstraint() {
    
    [coverBtn, check, imgV, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      coverBtn.topAnchor.constraint(equalTo: contentView.topAnchor),
      coverBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      coverBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      coverBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      imgV.topAnchor.constraint(equalTo: coverBtn.topAnchor, constant: 10),
      imgV.leadingAnchor.constraint(equalTo: coverBtn.leadingAnchor, constant: 10),
      imgV.widthAnchor.constraint(equalToConstant: 80),
      imgV.heightAnchor.constraint(equalToConstant: 80),
      
      titleLabel.centerYAnchor.constraint(equalTo: coverBtn.centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 12),
      titleLabel.heightAnchor.constraint(equalToConstant: 18),
      
      check.topAnchor.constraint(equalTo: coverBtn.topAnchor, constant: 43.21),
      check.trailingAnchor.constraint(equalTo: coverBtn.trailingAnchor, constant: -8),
      check.widthAnchor.constraint(equalToConstant: 8),
      check.heightAnchor.constraint(equalToConstant: 13.5)
    ])
  }
  
  func configure(data: [String: Any]) {
    if SingletonClass.shared.arrData.isEmpty == true {
      imgV.backgroundColor = .systemGray
      titleLabel.text = "쓸애기"
    } else {
      
      
      let img = data["재활용"] as? String ?? "없음"
      
      imgV.image = UIImage(named: img)
      titleLabel.text = img
    }
  }
}
