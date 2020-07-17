//
//  GuideViewController.swift
//  Eco-Friends
//
//  Created by ㅇ오ㅇ on 2020/07/17.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
  
  let textLabel = UILabel()
  let searchTextBar = UIView()
  
  let searchText = UITextField()
  let searchButton = UIButton()
  
  let buttonBox = UIView()
  let buttonBoxInBtn = ["음식물", "재활용", "일반", "대형"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [textLabel, searchTextBar, buttonBox].forEach { view.addSubview($0) }
    
    textLabel.text = "똑똑한 분리수거 방법\n지금 찾아보세요."
    textLabel.font = UIFont.boldSystemFont(ofSize: 25)
    textLabel.numberOfLines = 2
    
    searchTextBar.backgroundColor = .lightGray
    searchTextBar.layer.cornerRadius = 10
    
    [searchText, searchButton].forEach {
      searchTextBar.addSubview($0)
    }
    
    searchText.placeholder = "궁금한 폐기물 처리 방법을 검색하세요."
    
    searchText.font = UIFont.systemFont(ofSize: 14)
    
    searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    searchButton.tintColor = .black
    searchButton.sizeToFit()
    
    var btnArray: [UIButton] = []
    for i in buttonBoxInBtn.indices {
      let btn = UIButton()
      btn.backgroundColor = .systemGray
      btn.setTitle(buttonBoxInBtn[i], for: .normal)
      btn.layer.cornerRadius = 15
      btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
      btnArray.append(btn)
    }
    let stackView = UIStackView(arrangedSubviews: btnArray)
    stackView.distribution = .fillEqually
    stackView.axis = .horizontal
    stackView.spacing = 8
    
    buttonBox.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: buttonBox.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: buttonBox.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: buttonBox.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: buttonBox.bottomAnchor)
    ])
  }
  
  @objc func btnClick(_ sender: UIButton) {
    print(sender)
  }
  
  func setConstraint() {
    [textLabel, searchTextBar, searchText, searchButton, buttonBox].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
      textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      textLabel.widthAnchor.constraint(equalToConstant: 219),
      textLabel.heightAnchor.constraint(equalToConstant: 60),
      
      searchTextBar.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
      searchTextBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      searchTextBar.widthAnchor.constraint(equalToConstant: 339),
      searchTextBar.heightAnchor.constraint(equalToConstant: 44),
      
      searchText.topAnchor.constraint(equalTo: searchTextBar.topAnchor, constant: 10),
      searchText.leadingAnchor.constraint(equalTo: searchTextBar.leadingAnchor, constant: 16),
      searchText.widthAnchor.constraint(equalToConstant: 218),
      searchText.heightAnchor.constraint(equalToConstant: 22),
      
      searchButton.topAnchor.constraint(equalTo: searchTextBar.topAnchor, constant: 12),
      searchButton.trailingAnchor.constraint(equalTo: searchTextBar.trailingAnchor, constant: -12),
      searchButton.widthAnchor.constraint(equalToConstant: 20),
      searchButton.heightAnchor.constraint(equalToConstant: 20),
      
      buttonBox.topAnchor.constraint(equalTo: searchTextBar.bottomAnchor, constant: 24),
      buttonBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      buttonBox.widthAnchor.constraint(equalToConstant: 339),
      buttonBox.heightAnchor.constraint(equalToConstant: 30),
      
    ])
    
  }
}
