//
//  MyPageCollectionViewCell1.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class  MyPageCollectionViewCell1 : UICollectionViewCell {
  static let identifier = " MyPageCollectionViewCell1"
  
  private let nameLabel = UILabel()
  private let memberShipLabel = UILabel()
  private let nextButton = UIButton()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
      
    setUI()
    setConstraint()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    
  }
  
  private func setUI() {
    nameLabel.text = "변윤나 님"
    nameLabel.textColor = .black
    nameLabel.textAlignment = .left
    nameLabel.font = UIFont.boldSystemFont(ofSize: 30)
    contentView.addSubview(nameLabel)
    
    memberShipLabel.text = "멤버쉽 이용중"
    memberShipLabel.textColor = UIColor(red: 67/255, green: 186/255, blue: 254/255, alpha: 1)
    memberShipLabel.textAlignment = .left
    memberShipLabel.font = UIFont.boldSystemFont(ofSize: 20)
    contentView.addSubview(memberShipLabel)
    
    nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    nextButton.tintColor = .lightGray
    contentView.addSubview(nextButton)
    
  }
  
  private func setConstraint() {
    [nameLabel, nextButton, memberShipLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      nameLabel.widthAnchor.constraint(equalToConstant: 130),
      nameLabel.heightAnchor.constraint(equalToConstant: 40),
      
      nextButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
      nextButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      nextButton.widthAnchor.constraint(equalToConstant: 15),
      nextButton.heightAnchor.constraint(equalToConstant: 20),
      
      memberShipLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 14),
      memberShipLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      memberShipLabel.widthAnchor.constraint(equalToConstant: 130),
      memberShipLabel.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
}
