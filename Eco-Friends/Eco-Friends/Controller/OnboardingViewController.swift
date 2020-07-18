//
//  ViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/14.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit
import PaperOnboarding
import Kingfisher

class OnboardingViewController: UIViewController {
  
  let onboarding = PaperOnboarding()
  let getButton = UIButton()
  
  let onboardingImage = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    onboarding.dataSource = self
    onboarding.delegate = self
    setupOnboarding()
    setView()
  }
  
  //MARK:- UI
   func setView(){
    
    getButton.backgroundColor = ColorPiker.customHanul
    getButton.alpha = 0
    getButton.layer.cornerRadius = view.frame.width/20
    getButton.setTitle("쓸-애기 시작하기", for: .normal)
    getButton.setTitleColor(.white, for: .normal)
    onboarding.addSubview(getButton)
    getButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    
    
    //      onboardingImage.image = UIImage(contentsOfFile: "PET.gif")
    //onboardingImage.alpha = 0
    onboarding.addSubview(onboardingImage)
    
    getButton.translatesAutoresizingMaskIntoConstraints = false
    onboardingImage.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
      
      onboardingImage.topAnchor.constraint(equalTo: view.topAnchor),
      onboardingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      onboardingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      //  onboardingImage.heightAnchor.constraint(equalToConstant: 100),
      
      
      getButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      getButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      getButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
      getButton.heightAnchor.constraint(equalToConstant: 44),
      
      
    ])
  }
  //MARK: -viewDidAppear

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.onboardingImage.alpha = 1.0
    self.onboardingImage.kf.indicatorType = .activity
    let gifs = ["https://qussk.github.io/image/PET.gif"]
    self.onboardingImage.kf.setImage(with: URL(string: gifs[0])!)
    print("dd")
  }
  
  
  //MARK: - Onboarding
  func setupOnboarding(){
    view.backgroundColor = .white
    view.addSubview(onboarding)
    
    onboarding.translatesAutoresizingMaskIntoConstraints = false
    
    for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
      let constraint = NSLayoutConstraint(item: onboarding,
                                          attribute: attribute,
                                          relatedBy: .equal,
                                          toItem: view,
                                          attribute: attribute,
                                          multiplier: 1,
                                          constant: 0)
      view.addConstraint(constraint)
    }
  }
  
}

//MARK:-PaperOnboardingDataSource
extension OnboardingViewController: PaperOnboardingDataSource {
  
  func onboardingItem(at index: Int) -> OnboardingItemInfo {
    
    
    let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
    let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
    
    return [OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "확실한 분리수거",
                                 description: "폐기물 처리 가이드를 통해\n제대로 된 분리수거 방법을 알아보세요.\n작은 노력 하나로 깨끗한 지구를 만들어요.",
                                 pageIcon: UIImage(named:"on")!,
                                 color: UIColor.white,
                                 titleColor: UIColor.black,
                                 descriptionColor: UIColor.black,
                                 titleFont: titleFont,
                                 descriptionFont: descirptionFont),
              OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "집 앞에서 픽업",
                                 description: "잠들기 전, 집 문 앞에 폐기물을 놓아두고\n쓸애기 서비스를 이용해보세요.\n잠든 사이에 수거해갈게요.",
                                 pageIcon: UIImage(named:"on")!,
                                 color: UIColor.white,
                                 titleColor: UIColor.black,
                                 descriptionColor: UIColor.black,
                                 titleFont: titleFont,
                                 descriptionFont: descirptionFont),
              OnboardingItemInfo(informationImage: UIImage(named:"back")!,
                                 title: "환경을 살리는 분리수거",
                                 description: "분리수거를 제대로 해야 재활용이 된다는 사실,\n알고 계신가요?",
                                 pageIcon: UIImage(named:"on")!,
                                 color: UIColor.white,
                                 titleColor: UIColor.black,
                                 descriptionColor: UIColor.black,
                                 titleFont: titleFont,
                                 descriptionFont: descirptionFont)
        ][index]
    }
  func onboardingItemsCount() -> Int {
    return 3
  }


//MARK:- Action
@objc func buttonClicked(_ sender: UIButton){
  
  let adressVC = AddressViewController()
  let adressNV = UINavigationController(rootViewController: adressVC)

  adressNV.modalPresentationStyle = .fullScreen
  present(adressNV, animated: true)
  
  
}
}


//MARK:-PaperOnboardingDelegate
extension OnboardingViewController: PaperOnboardingDelegate {

   func onboardingConfigurationItem(_: OnboardingContentViewItem, index _: Int) {
      
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
      
      if index == 0 {
        if self.getButton.alpha == 1 {
          UIView.animate(withDuration: 0.1, animations: {
            self.getButton.alpha = 0
          })
        }
      }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
      if index == 0 {
        UIView.animate(withDuration: 0.1, animations: {
          self.onboardingImage.alpha = 1
        })
      }else if index == 1 {
        UIView.animate(withDuration: 0.1, animations: {
          self.onboardingImage.alpha = 0
        })
        
      } else {
        UIView.animate(withDuration: 0.2, animations: {
          self.getButton.alpha = 1
        })
        
      }
    }
    
    
    
  }





