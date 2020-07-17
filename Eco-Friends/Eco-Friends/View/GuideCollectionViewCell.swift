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
  
  let check = UIImageView()
  let imgV = UIImageView()
  let TitleLabel = UILabel()
  let subLabel = UILabel()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [check, imgV, TitleLabel, subLabel].forEach { contentView.addSubview($0) }
    
    TitleLabel.font = .boldSystemFont(ofSize: 15)
    
    check.image = UIImage(systemName: "shevron.right")
    
  }
  
  func setConstraint() {
    [check, imgV, TitleLabel, subLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imgV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      imgV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      imgV.widthAnchor.constraint(equalToConstant: 80),
      imgV.heightAnchor.constraint(equalToConstant: 80),
      
      TitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
      TitleLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 16),
      TitleLabel.widthAnchor.constraint(equalToConstant: 55),
      TitleLabel.heightAnchor.constraint(equalToConstant: 18),
      
      subLabel.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 8),
      subLabel.leadingAnchor.constraint(equalTo: imgV.trailingAnchor, constant: 16),
      subLabel.widthAnchor.constraint(equalToConstant: 36),
      subLabel.heightAnchor.constraint(equalToConstant: 13),
      
      check.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 43.21),
      check.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
      check.widthAnchor.constraint(equalToConstant: 8),
      check.heightAnchor.constraint(equalToConstant: 13.57)
    ])
  }
  
  func configure() {
    
  }
  
}
