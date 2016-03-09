//
//  MainTabBarController.swift
//  SmallDayDemo
//
//  Created by iStig on 16/3/9.
//  Copyright © 2016年 iStig. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
       super.viewDidLoad()
      
       setUpAllChildViewController()
      
      //由于tabBar是readonly 所以用KVC来设置 http://www.tuicool.com/articles/M7vQRj
      self.setValue(MainTabBar(), forKey: "tabBar")
        // Do any additional setup after loading the view.
    }
     private func setUpAllChildViewController() {
      tabBarAddChildViewController(vc: ExploreViewController(), title: "探店",
        imageName: "recommendation_1", selectedImageName: "recommendation_2")
      
      tabBarAddChildViewController(vc: ExperienceViewController(), title: "体验",
        imageName: "broadwood_1", selectedImageName: "broadwood_2")
      
      tabBarAddChildViewController(vc: ClassifyViewController(), title: "分类",
        imageName: "classification_1", selectedImageName: "classification_2")
      
      tabBarAddChildViewController(vc: MeViewController(), title: "我的",
        imageName: "my_1", selectedImageName: "my_2")
  }
  
  private func tabBarAddChildViewController(vc
    vc:UIViewController,
    title:String,
    imageName:String,
    selectedImageName:String) {
      let image = UIImage(named: imageName)
      let seletedImage = UIImage(named: selectedImageName)
      vc.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: seletedImage)
      vc.view.backgroundColor = theme.SDBackgroundColor
      let nav = MainNavigationController(rootViewController:vc)
      addChildViewController(nav)
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class MainTabBar:UITabBar {
  override init(frame:CGRect) {
    super.init(frame:frame)
    self.translucent = false
    self.backgroundImage = UIImage(named: "bar")
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}