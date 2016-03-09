//
//  MainNavigationController.swift
//  SmallDayDemo
//
//  Created by iStig on 16/3/9.
//  Copyright © 2016年 iStig. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = nil
        // Do any additional setup after loading the view.
    }
  
  lazy var backButton:UIButton = {
    //设置返回按钮属性
    let backBtn = UIButton(type: UIButtonType.Custom)
    backBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
    backBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
    backBtn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
    backBtn.setImage(UIImage(named: "back_1"), forState: .Normal)
    backBtn.setImage(UIImage(named: "back_2"), forState: .Highlighted)
    backBtn.addTarget(self, action:Selector("backBtnClick"), forControlEvents: .TouchUpInside)
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0)
    backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
    let btnW: CGFloat = AppWidth > 375.0 ? 50 : 44
    backBtn.frame = CGRectMake(0, 0, btnW, 40)
    return backBtn
  }()
  
  override func pushViewController(viewController: UIViewController, animated: Bool) {
    if self.childViewControllers.count > 0 {
    let vc = self.childViewControllers[0]
      if self.childViewControllers.count == 1 {
        backButton.setTitle(vc.tabBarItem.title, forState: .Normal)
      }else {
        backButton.setTitle("返回", forState: .Normal)
      }
      
      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backButton)
      viewController.hidesBottomBarWhenPushed = true
    }
    
    super.pushViewController(viewController, animated: animated)
  }
  
  func backBtnClick() {
    self.popViewControllerAnimated(true)
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
