//
//  LeadpageViewController.swift
//  SmallDayDemo
//
//  Created by iStig on 15/12/12.
//  Copyright © 2015年 iStig. All rights reserved.
//

import UIKit

public let SD_ShowMainTabbarController_Notification = "SD_ShowMainTabbarController_Notification"

class LeadpageViewController: UIViewController {
  
  private var backgroundImage = UIImageView(frame: MainBounds)
  private let startButton = NoHighlightButton()

    override func viewDidLoad() {
        super.viewDidLoad()
      var leadPageImage:UIImage!
      
      switch AppHeight {
      case 736: leadPageImage = UIImage(named: "fourpage-414w-736h")
      case 667: leadPageImage = UIImage(named: "fourpage-375w-667h")
      case 568: leadPageImage = UIImage(named: "fourpage-320w-568h")
      default:  leadPageImage = UIImage(named: "fourpage-320w-480h")
      }
      
      backgroundImage.image = leadPageImage
      view.addSubview(backgroundImage)
      
      startButton.setBackgroundImage(UIImage(named:"into_home"), forState:UIControlState.Normal)
      startButton.setTitle("开始小日子", forState: UIControlState.Normal)
      startButton.setTitleColor(UIColor.whiteColor(), forState:.Normal)
      startButton.frame = CGRect(x: (AppWidth - 210) * 0.5, y: AppHeight - 120, width: 210, height: 45)
      startButton.addTarget(self, action: Selector("showMainTabbar"), forControlEvents:UIControlEvents.TouchUpInside)
      view.addSubview(startButton)
        // Do any additional setup after loading the view.
    }
  
  func showMainTabbar() {
    NSNotificationCenter.defaultCenter().postNotificationName(SD_ShowMainTabbarController_Notification, object:nil)
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


