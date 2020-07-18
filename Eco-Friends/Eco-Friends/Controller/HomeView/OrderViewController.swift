//
//  OrderViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
// 배고파

import UIKit

class OrderViewController: UIViewController {
  //MARK: - Properties
  let text = UITextField()
  private let textLabel = UILabel()
  private let addressButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("성동구 성수이로 108", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    bt.tintColor = .black
    bt.sizeToFit()
    bt.semanticContentAttribute = .forceRightToLeft
    return bt
  }()
  private let divider1 = DividerView()
  private let divider2 = DividerView()
  private var stackView = UIStackView()
  private var scrollView = UIScrollView()
  private var scrollFrame = CGRect(x: 0, y: 306, width: 0, height: 0)

  private var datas : [String] = ["14\n오늘", "15\n수요일", "16\n목요일", "17\n금요일", "18\n토요일"]
  private var popUpView = PopUpLoginView()
  private let cancelButton = UIButton()
  private var floatingCenterYConstraint : NSLayoutConstraint!
  
  private let buttonGeneral : Button = {
    let bt = Button()
    bt.setTitle("일반", for: .normal)
    return bt
  }()
  private let buttonTrash : Button = {
    let bt = Button()
    bt.setTitle("음식물", for: .normal)
    return bt
  }()
  private let buttonRecycle : Button = {
    let bt = Button()
    bt.setTitle("재활용", for: .normal)
    return bt
  }()
  private let buttonBig : Button = {
    let bt = Button()
    bt.setTitle("대형", for: .normal)
    return bt
  }()
  private let reserveButton = UIButton()
  
  //MARK: - viewDidLoad()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.clipsToBounds = true
    view.layer.cornerRadius = 20
    view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    
    popUpView.clipsToBounds = true
    popUpView.layer.cornerRadius = 20
    popUpView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
    
    setUI()
    setScrollView()
    setConstraint()
  }
  
  //MARK: - setUI()
  private func setUI() {
    
    textLabel.text = "오늘 11시 50분 전 예약하면\n 내일 오전 7시 전 수거!"
    textLabel.numberOfLines = 2
    textLabel.textColor = UIColor.black.withAlphaComponent(0.6)
    textLabel.font = UIFont.boldSystemFont(ofSize: 15)
    view.addSubview(textLabel)
    
    view.addSubview(addressButton)
    
    view.addSubview(divider1)
    view.addSubview(divider2)
    
    view.addSubview(scrollView)
    
    stackView.addArrangedSubview(buttonGeneral)
    stackView.addArrangedSubview(buttonTrash)
    stackView.addArrangedSubview(buttonRecycle)
    stackView.addArrangedSubview(buttonBig)
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    view.addSubview(stackView)
    
    reserveButton.setTitle("예약하기", for: .normal)
    reserveButton.setTitleColor(.white, for: .normal)
    reserveButton.backgroundColor = UIColor(red: 153/255, green: 193/255, blue: 252/255, alpha: 1)
    reserveButton.layer.cornerRadius = view.frame.width/17
    reserveButton.addTarget(self, action: #selector(reserveClicked(_:)), for: .touchUpInside)
    view.addSubview(reserveButton)
    
    popUpView.backgroundColor = .white
    popUpView.addSubview(cancelButton)
    view.addSubview(popUpView)
    
    cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    cancelButton.addTarget(self, action: #selector(clickCancelButton(_:)), for: .touchUpInside)
    popUpView.addSubview(cancelButton)
  }
  
  //MARK: -  setScrollView()
  private func setScrollView() {

    scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(3), height: 80)
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
    
    for index in datas.indices {

      scrollFrame.size = scrollView.frame.size
      
      var dateLabel = UILabel()
      dateLabel = UILabel(frame: CGRect(x: 100 * CGFloat(index), y: 0, width: 80, height: 80))
      dateLabel.numberOfLines = 2
      dateLabel.text = datas[index]
      scrollView.addSubview(dateLabel)
    }
    
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    
    
    [textLabel, addressButton, divider1, divider2, scrollView ,stackView, reserveButton, popUpView, cancelButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
      textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textLabel.heightAnchor.constraint(equalToConstant: 50),
      
      addressButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5),
      addressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      addressButton.heightAnchor.constraint(equalToConstant: 30),
      
      
      divider1.topAnchor.constraint(equalTo: addressButton.bottomAnchor, constant: 10),
      divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      divider1.heightAnchor.constraint(equalToConstant: 1),
      
      scrollView.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 10),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      scrollView.heightAnchor.constraint(equalToConstant: 80),
      
      divider2.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
      divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      divider2.heightAnchor.constraint(equalToConstant: 1),
      
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 30),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
      stackView.heightAnchor.constraint(equalToConstant: 80),
      
<<<<<<< HEAD
      reserveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant : 32),
      reserveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 59.5),
      reserveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64.5),
//      reserveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
      reserveButton.heightAnchor.constraint(equalToConstant: 50)
=======
      reserveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant : 20),
      reserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      reserveButton.widthAnchor.constraint(equalToConstant: 251),
      reserveButton.heightAnchor.constraint(equalToConstant: 44),
      

      popUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      popUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      
      cancelButton.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 6),
      cancelButton.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 329),
      cancelButton.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: -2),
      cancelButton.heightAnchor.constraint(equalToConstant: 44)
>>>>>>> 76f09aa8017398765776226b777f2db5ea4f0536
    ])
    
      let defaultCenterYConst = popUpView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: 130)
      defaultCenterYConst.priority = UILayoutPriority(500)
      defaultCenterYConst.isActive  = true
    
    floatingCenterYConstraint = popUpView.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
    floatingCenterYConstraint.priority = .defaultLow
    floatingCenterYConstraint.isActive = true
    
  }
  
  //MARK:- Action
  
  @objc func reserveClicked(_ sender: UIButton){

    view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
    
    UIView.animate(withDuration: 0.4) {
      self.floatingCenterYConstraint.priority = .defaultHigh
        self.view.layoutIfNeeded()
    }
  
  }
  
  @objc func clickCancelButton(_ sender : UIButton) {
    
    view.backgroundColor = .clear
    UIView.animate(withDuration: 0.4) {
      self.floatingCenterYConstraint.priority  =  .defaultLow
        self.view.layoutIfNeeded()
    }

  }
}

//MARK: - extension UIScrollViewDelegate

extension OrderViewController : UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
  }
}
