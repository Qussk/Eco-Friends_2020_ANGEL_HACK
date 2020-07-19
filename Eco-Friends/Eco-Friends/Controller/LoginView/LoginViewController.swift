//
//  LoginViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/15.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  let idTextField = UITextField()
  let pwTextField = UITextField()
  let loginButton = UIButton()
  let loginLable = UILabel()
  let signUpButton = UIButton()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
<<<<<<< HEAD
    view.backgroundColor = .systemBackground
   
=======
    view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    
>>>>>>> e13ce55a7dd1f31262999831c876699bdc707e9c
    setView()
    setConstrain()
    setNavigationBar()
    
  }
  
  
  func setView(){
    loginButton.setTitle("로그인", for: .normal)
    loginButton.backgroundColor = ColorPiker.customHanul
    loginButton.setTitleColor(.white, for: .normal)
    loginButton.layer.cornerRadius = view.frame.width/17
    loginButton.addTarget(self, action: #selector(loginGoing(_:)), for: .touchUpInside)
    
    loginLable.alpha = 0
    
    idTextField.borderStyle = .none
    idTextField.keyboardType = .numberPad
    idTextField.placeholder = "전화번호"
    idTextField.font = UIFont.systemFont(ofSize: 14)
    
    pwTextField.borderStyle = .none
    pwTextField.keyboardType = .emailAddress
    pwTextField.isSecureTextEntry = true
    pwTextField.placeholder = "비밀번호"
    pwTextField.font = UIFont.systemFont(ofSize: 14)
    
    loginLable.text = "혹시, 쓸애기가 처음이신가요?"
    loginLable.font = UIFont.systemFont(ofSize: 16)
    
    
    signUpButton.setTitle("회원가입", for: .normal)
    signUpButton.setTitleColor(UIColor(red: 67/255, green: 187/255, blue: 254/255, alpha: 1), for: .normal)
    signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    
    signUpButton.alpha = 0
    
  }
  
  @objc func loginGoing(_ sender: UIButton){
    dismiss(animated: true)
  }
  
  @objc func loginGoing(_ sender: UIButton){
    dismiss(animated: true)
  }
  
  func setConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    [idTextField,pwTextField,loginButton,loginLable,signUpButton].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview($0)
    }
    
    [idTextField,pwTextField].forEach{
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    }
    
    
    NSLayoutConstraint.activate([
      
      idTextField.topAnchor.constraint(equalTo: guide.topAnchor, constant: 60),
      idTextField.heightAnchor.constraint(equalToConstant: 44),
      
      pwTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 26),
      pwTextField.heightAnchor.constraint(equalToConstant: 44),
      
      loginButton.topAnchor.constraint(equalTo: pwTextField.bottomAnchor, constant: 36),
      loginButton.heightAnchor.constraint(equalToConstant: 44),
      loginButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      loginButton.widthAnchor.constraint(equalToConstant: 251),
      
      loginLable.topAnchor.constraint(equalTo: loginButton.bottomAnchor),
      loginLable.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      loginLable.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -130),
      
      signUpButton.topAnchor.constraint(equalTo: loginLable.bottomAnchor),
      signUpButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      signUpButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -260)
    ])
  }
  
  func setNavigationBar(){
    
    navigationItem.title = "로그인"
    let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(clickXmarkButton))
    navigationItem.rightBarButtonItem = barButtonItem
    //
  }
  
  func passwordUnderline() {
    pwTextField.borderStyle = .none
    let border = CALayer()
    border.frame = CGRect(x: 0, y: pwTextField.frame.size.height-1, width: pwTextField.frame.width, height: 0.5)
    border.backgroundColor = UIColor.gray.cgColor
    pwTextField.layer.addSublayer((border))
    
    
    idTextField.borderStyle = .none
    
    let border1 = CALayer()
    border1.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: idTextField.frame.width, height: 0.5)
    border1.backgroundColor = UIColor.gray.cgColor
    idTextField.layer.addSublayer((border1))
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    
    UIView.animate(withDuration: 0.5, animations: {
      self.loginLable.alpha = 1
      self.signUpButton.alpha = 1
      
    })
    passwordUnderline()
    
    
  }
  
  @objc func clickXmarkButton () {
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
