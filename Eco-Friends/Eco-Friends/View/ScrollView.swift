//
//  ScrollView.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/16.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class ScrollView : UIScrollView {
  
  private let dateLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
//    frame = CGRect(x: <#T##Double#>, y: <#T##Double#>, width: <#T##Double#>, height: <#T##Double#>)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
