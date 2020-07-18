//
//  ViewController.swift
//  juso
//
//  Created by ㅇ오ㅇ on 2020/07/15.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
  
  let text = UILabel()
  let searchText = UITextField()
  let searchButton = UIButton()
  let nowButton = UIButton()
  let nearLabel = UILabel()
  let naviXButton = UIBarButtonItem()
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(
    frame: .zero, collectionViewLayout: layout
  )

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    colletionLayout()
    setConstraint()
  }
  
  func setUI() {
    navigationItem.title = "주소 검색"
    navigationItem.rightBarButtonItem = naviXButton
    naviXButton.image = UIImage(systemName: "xmark")
    naviXButton.tintColor = .black
    
    view.backgroundColor = .lightGray
    collectionView.backgroundColor = .lightGray
    collectionView.dataSource = self
    collectionView.register(AddressCollectionViewCell.self, forCellWithReuseIdentifier: AddressCollectionViewCell.identifier)
    
    [text, searchText, searchButton, nowButton, nearLabel, collectionView].forEach { view.addSubview($0) }
    
    text.numberOfLines = 2
    text.text = "지번, 도로명, 건물명을 \n입력하세요."
    text.font = .preferredFont(forTextStyle: .title2)
    
    searchText.placeholder = "  예) 성동구 성수이로 108"
    searchText.backgroundColor = .white
    searchText.layer.cornerRadius = 10
    
    searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    searchButton.backgroundColor = .white
    searchButton.layer.cornerRadius = 10
    
    nowButton.setImage(UIImage(systemName: "leaf.arrow.circlepath"), for: .normal)
    nowButton.setTitle(" 현 위치로 주소 설정", for: .normal)
    nowButton.setTitleColor(.black, for: .normal)
    nowButton.backgroundColor = .white
    nowButton.layer.cornerRadius = 10
    nowButton.addTarget(self, action: #selector(moveToHomeView), for: .touchUpInside)
    
    nearLabel.text = "최근 주소"
    nearLabel.font = UIFont.systemFont(ofSize: 13)
    nearLabel.sizeToFit()
  }
  
  func colletionLayout() {
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 0
    layout.itemSize = CGSize(width: 339, height:132)
    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    
    [text, searchText, nowButton, nearLabel, collectionView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
    }
    
    searchButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      text.topAnchor.constraint(equalTo: guide.topAnchor, constant: 24),
      text.heightAnchor.constraint(equalToConstant: 62),
      text.widthAnchor.constraint(equalToConstant: 243),
      
      searchText.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 23),
      searchText.widthAnchor.constraint(equalToConstant: 289),
      searchText.heightAnchor.constraint(equalToConstant: 44),
      
      searchButton.topAnchor.constraint(equalTo: searchText.topAnchor),
      searchButton.leadingAnchor.constraint(equalTo: searchText.trailingAnchor, constant: 4),
      searchButton.widthAnchor.constraint(equalToConstant: 46),
      searchButton.heightAnchor.constraint(equalToConstant: 44),
      
      nowButton.topAnchor.constraint(equalTo: searchText.bottomAnchor, constant: 8),
      nowButton.widthAnchor.constraint(equalToConstant: 339),
      nowButton.heightAnchor.constraint(equalToConstant: 46),
      
      nearLabel.topAnchor.constraint(equalTo: nowButton.bottomAnchor, constant: 20),
      nearLabel.widthAnchor.constraint(equalToConstant: 51),
      nearLabel.heightAnchor.constraint(equalToConstant: 17),
      
      collectionView.topAnchor.constraint(equalTo: nearLabel.bottomAnchor, constant: 8),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -18),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
  
  @objc func moveToHomeView() {

    let homeNavi = UINavigationController(rootViewController: HomeViewController())
    let searchNavi = UINavigationController(rootViewController: SearchViewController())
    let descriptionNavi = UINavigationController(rootViewController: DescriptionViewController())
    let myPageNavi = UINavigationController(rootViewController: MyPageViewController())
    let tabVC = UITabBarController()
    
    tabVC.viewControllers = [homeNavi, searchNavi, descriptionNavi, myPageNavi]
    
    homeNavi.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    searchNavi.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
    descriptionNavi.tabBarItem = UITabBarItem(title: "기업 소개", image: UIImage(systemName: "globe"), tag: 2)
    myPageNavi.tabBarItem = UITabBarItem(title: "마이 페이지", image: UIImage(systemName: "person"), tag: 4)
    
    tabVC.modalPresentationStyle = .fullScreen
    present(tabVC, animated: true)
  }
}

extension AddressViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddressCollectionViewCell.identifier, for: indexPath) as! AddressCollectionViewCell
    
    return cell
  }
}
