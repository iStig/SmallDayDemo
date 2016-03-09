//
//  theme.swift
//  SmallDayDemo
//
//  Created by iStig on 15/12/12.
//  Copyright © 2015年 iStig. All rights reserved.
//

import UIKit

public let MainBounds: CGRect  = UIScreen.mainScreen().bounds
public let AppWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
public let AppHeight: CGFloat = UIScreen.mainScreen().bounds.size.height


struct theme {
  //主题配置
  static let SDTabBarItemFont:UIFont = UIFont.systemFontOfSize(12)
  static let SDNavItemFont:UIFont = UIFont.systemFontOfSize(16)
  static let SDNavTitleFont:UIFont = UIFont.systemFontOfSize(18)
  static let SDBackgroundColor:UIColor = UIColor.colorWith(255, green: 255, blue: 255, alpha: 1)
  static let SDWebViewBackGroundColor:UIColor = UIColor.colorWith(245, green: 245, blue: 245, alpha: 1)
  
  static let ShareViewHeight:CGFloat = 215
  //第三方
  static let UMSharedAPPKey:String = "55e2f45b67e58ed4460012db"
  static let WXAppID:String = "wx485c6ee1758251bd"
  static let WXAppSecret:String = "468ab73eef432f59a2aa5630e340862f"
  
  //关于作者
  static let GithubURL:String = "https://github.com/ZhongTaoTian"
  static let JianShuURL:String = "http://www.jianshu.com/users/5fe7513c7a57/latest_articles"
  static let SinaURL:String = "http://weibo.com/u/5622363113/home?topnav=1&wvr=6"
  
  // cache文件路径
  static let CachesPath:String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
  static let AppShare = UIApplication.sharedApplication()
  static let GaoDeAppKey:String = "2e6b9f0a88b4a79366a13ce1ee9688b8"
}
