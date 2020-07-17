//
//  MyPageViewCollectionCell.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class MyPageViewCollectionCel3 : UITableViewCell {
  static let identifier = "MyPageViewCollectionCell"
  
  var datas = ["주문목록", "멤버십 관리", "이벤트", "공지사항", "고객센터", "환경설정"]
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI(){
    
  }
  
  private func setConstraint() {
    
  }
  
}
