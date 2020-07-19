//
//  ReserveViewController.swift
//  CustomViewController
//
//  Created by ㅇ오ㅇ on 2020/07/19.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SelectReserveViewController: UIViewController {
  
  let titleLabel = UILabel()
  let subLabel = UILabel()
  
  let stackFirst = UIView()
  let stackSecond = UIView()
  
  let stackFirstData = ["일반버튼", "음식물버튼"]
  let stackSecondData = ["재활용버튼", "대형버튼"]
  
  let clickFirstButton = ["일반버튼1", "음식물버튼1"]
  let clickSecondButton = ["재활용버튼1", "대형버튼1"]
  
  var stackInFirstData: [UIButton] = []
  var stackInSecondData: [UIButton] = []
  
  let selectButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setStack()
    setConstraint()
  }
  
  func setUI() {
    view.backgroundColor = .systemBackground
    [titleLabel, subLabel, selectButton, stackFirst, stackSecond].forEach { view.addSubview($0) }
    
    titleLabel.text = "수거 예약할 폐기물 종류를 \n선택해 주세요."
    titleLabel.numberOfLines = 2
    titleLabel.font = UIFont(name: "TeluguSangamMN-Bold", size: 25)
    
    subLabel.text = "선택한 날짜의 오후 11시 50분 전에 놓아두면 \n다음날 오전 7시 전에 수거해 갈게요."
    subLabel.numberOfLines = 2
    subLabel.font = UIFont(name: "TeluguSangamMN", size: 12)
    
    selectButton.setTitle("선택완료", for: .normal)
    selectButton.backgroundColor = .systemBlue
    selectButton.layer.cornerRadius = 20
  }
  
  func setStack() {
    for i in stackFirstData.indices {
      let btn = UIButton()
      btn.tag = i
      btn.setImage(UIImage(named: stackFirstData[i]), for: .normal)
      btn.addTarget(self, action: #selector(firstStack(_:)), for: .touchUpInside)
      stackInFirstData.append(btn)
    }
    
    for i in stackSecondData.indices {
      let btn = UIButton()
      btn.tag = i
      btn.setImage(UIImage(named: stackSecondData[i]), for: .normal)
      btn.addTarget(self, action: #selector(secondStack(_:)), for: .touchUpInside)
      stackInSecondData.append(btn)
    }
    
    let stackView = UIStackView(arrangedSubviews: stackInFirstData)
    let stackView2 = UIStackView(arrangedSubviews: stackInSecondData)
    
    [stackView, stackView2].forEach {
      $0.distribution = .fillEqually
      $0.axis = .horizontal
      $0.spacing = 13
    }
    
    stackFirst.addSubview(stackView)
    stackSecond.addSubview(stackView2)
    
    [stackView, stackView2].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: stackFirst.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: stackFirst.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: stackFirst.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: stackFirst.bottomAnchor),
      
      stackView2.topAnchor.constraint(equalTo: stackSecond.topAnchor),
      stackView2.leadingAnchor.constraint(equalTo: stackSecond.leadingAnchor),
      stackView2.trailingAnchor.constraint(equalTo: stackSecond.trailingAnchor),
      stackView2.bottomAnchor.constraint(equalTo: stackSecond.bottomAnchor)
    ])
  }
  
  @objc func firstStack(_ sender: UIButton) {
    let tag = sender.tag
    
    if sender.isSelected {
      stackInFirstData[tag].setImage(UIImage(named: stackFirstData[tag]), for: .normal)
      sender.isSelected = false
    } else {
      stackInFirstData[tag].setImage(UIImage(named: clickFirstButton[tag]), for: .normal)
      sender.isSelected = true
    }
    
  }
  
  @objc func secondStack(_ sender: UIButton) {
    let tag = sender.tag
    
    if sender.isSelected {
      stackInSecondData[tag].setImage(UIImage(named: stackSecondData[tag]), for: .normal)
      sender.isSelected = false
    } else {
      stackInSecondData[tag].setImage(UIImage(named: clickSecondButton[tag]), for: .normal)
      sender.isSelected = true
    }
  }
  
  
  
  func setConstraint() {
    [titleLabel, subLabel, selectButton, stackFirst, stackSecond].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 124),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      titleLabel.heightAnchor.constraint(equalToConstant: 70),
      
      subLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
      subLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      subLabel.heightAnchor.constraint(equalToConstant: 42),
      
      stackFirst.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 56),
      stackFirst.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      stackFirst.widthAnchor.constraint(equalToConstant: 339),
      stackFirst.heightAnchor.constraint(equalToConstant: 140),
      
      stackSecond.topAnchor.constraint(equalTo: stackFirst.bottomAnchor, constant: 13),
      stackSecond.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
      stackSecond.widthAnchor.constraint(equalToConstant: 339),
      stackSecond.heightAnchor.constraint(equalToConstant: 140),
      
      selectButton.topAnchor.constraint(equalTo: stackSecond.bottomAnchor, constant: 128),
      selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      selectButton.widthAnchor.constraint(equalToConstant: 251),
      selectButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
}