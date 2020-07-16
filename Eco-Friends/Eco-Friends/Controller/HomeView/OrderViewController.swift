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
  private let divider1 = DividerView()
  private let divider2 = DividerView()
  private let stackView = UIStackView()
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
    view.backgroundColor = .red
    view.clipsToBounds = true
    view.layer.cornerRadius = 20
    view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    
    setUI()
    setConstraint()
  }
  
  //MARK: - setUI()
  private func setUI() {
    
    textLabel.text = "오늘 11시 50분 전 예약하면\n 내일 오전 7시 전 수거!"
    textLabel.numberOfLines = 2
    textLabel.textColor = UIColor.black.withAlphaComponent(0.6)
    textLabel.font = UIFont.boldSystemFont(ofSize: 15)
    view.addSubview(textLabel)
    
    view.addSubview(divider1)
    view.addSubview(divider2)
    
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
    reserveButton.backgroundColor = UIColor(red: 67/255, green: 187/255, blue: 254/255, alpha: 1)
    reserveButton.layer.cornerRadius = view.frame.width / 17
    reserveButton.addTarget(self, action: #selector(reserveClicked(_:)), for: .touchUpInside)
    view.addSubview(reserveButton)
    
    
    
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    [textLabel, divider1, divider2, stackView, reserveButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
      textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100.5),
      textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -99.5),
      textLabel.heightAnchor.constraint(equalToConstant: 50),
      
      divider1.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 28),
      divider1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      divider1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      divider1.heightAnchor.constraint(equalToConstant: 1),
      
      divider2.topAnchor.constraint(equalTo: divider1.bottomAnchor, constant: 115),
      divider2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      divider2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      divider2.heightAnchor.constraint(equalToConstant: 1),
      
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: divider2.bottomAnchor, constant: 30),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
      stackView.heightAnchor.constraint(equalToConstant: 80),
      
      reserveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant : 32),
      reserveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 59.5),
      reserveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64.5),
      reserveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
    ])
  }
  
  //MARK:- Action
  
  @objc func reserveClicked(_ sender: UIButton){
    
    let reserveVC = ReserveViewController()
    navigationController?.pushViewController(reserveVC, animated: false)
    reserveVC.modalPresentationStyle = .fullScreen

  }
  
  
}
