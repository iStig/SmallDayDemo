//
//  AppDelegate.swift
//  SmallDayDemo
//
//  Created by iStig on 15/12/11.
//  Copyright © 2015年 iStig. All rights reserved.
//

import UIKit
import SDWebImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    setupKeyWindow()
    setShared()
    setUserMapInfo()
    
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector:Selector("showMianViewController"),
      name: SD_ShowMainTabbarController_Notification,
      object: nil)
    return true
  }
  
  //MARK: - Private
  private func setupKeyWindow() {//设置根视图控制器
    window = UIWindow(frame:MainBounds)
    window?.rootViewController =  showLeadpage()
    window?.makeKeyAndVisible()
  }
  
  private func setAppAppearance() {
    //设置tab栏tabBrItem字体颜色
    let tabBarItemAppearance = UITabBarItem.appearance()
    tabBarItemAppearance.setTitleTextAttributes(
      [NSForegroundColorAttributeName:UIColor.blackColor(),
        NSFontAttributeName:theme.SDTabBarItemFont],
      forState: UIControlState.Normal)
    tabBarItemAppearance.setTitleTextAttributes(
      [NSForegroundColorAttributeName:UIColor.grayColor(),
        NSFontAttributeName:theme.SDTabBarItemFont],
      forState: UIControlState.Selected)
    
    //设置导航栏lantitle字体颜色
    let navigationAppearance = UINavigationBar.appearance()
    navigationAppearance.translucent = false
    navigationAppearance.titleTextAttributes = [NSFontAttributeName:theme.SDNavTitleFont,NSForegroundColorAttributeName:UIColor.blackColor()]
    //设置导航栏barButton字体颜色
    let barButtonItemAppearance = UIBarButtonItem.appearance()
    barButtonItemAppearance.setTitleTextAttributes(
      [NSForegroundColorAttributeName:UIColor.blackColor(),
        NSFontAttributeName:theme.SDNavItemFont], forState: UIControlState.Normal)
  }
  
  private func setShared() {
    UMSocialData.setAppKey(theme.UMSharedAPPKey)
    UMSocialSinaHandler.openSSOWithRedirectURL(nil)
    UMSocialWechatHandler.setWXAppId(theme.WXAppID, appSecret:theme.WXAppSecret, url: theme.JianShuURL)
  }
  
  private func setUserMapInfo() {
    UserInfoManager.sharedUserInfoManager.startUserlocation()
    AMapSearchServices.sharedServices().apiKey = theme.GaoDeAppKey
  }
  
  private func showLeadpage() -> UIViewController{
    let versionString = "CFBundleShortVersionString"
    let currentVersion = NSBundle.mainBundle().infoDictionary![versionString] as! String;
    let preVersion = (NSUserDefaults.standardUserDefaults().objectForKey(versionString) as? String) ?? "";//注意??用法
    //currentVersion与preVersion相比是否是降序,即preVersioncurrentVersion比currentVersion版本小,在OC中要尤其注意判断是否为空
    //true情况
    //currentVersion = "1.1"  preVersion = "1.0"
    //false情况
    //currentVersion = "1.1"  preVersion = "1.3"
    if currentVersion.compare(preVersion) == NSComparisonResult.OrderedDescending {
      NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: versionString)
      NSUserDefaults.standardUserDefaults().synchronize()
      return LeadpageViewController()
    }
    return MainTabBarController()
  }
  
  //MARK: - Public
  func showMianViewController () {//当新版本第一次先进引导页再进MainTabBarController并且展示城市选择页
    let mainTabBarVC = MainTabBarController()
    self.window!.rootViewController = mainTabBarVC
    let nav = mainTabBarVC.viewControllers![0] as? MainNavigationController
    let mainVC = nav?.viewControllers[0] as! MainViewController
    mainVC.pushCityView()
  }
  
  //MARK: - deinit
  deinit {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  
  func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
    return UMSocialSnsService.handleOpenURL(url)
  }
  
  func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
    return UMSocialSnsService.handleOpenURL(url)
  }
  
  
  func applicationDidReceiveMemoryWarning(application: UIApplication) {
    SDWebImageManager.sharedManager().imageCache.cleanDisk()
    SDWebImageManager.sharedManager().cancelAll()
  }
  
  
  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}

