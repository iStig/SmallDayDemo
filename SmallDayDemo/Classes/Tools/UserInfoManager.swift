//
//  UserInfoManager.swift
//  SmallDayDemo
//
//  Created by iStig on 16/3/9.
//  Copyright © 2016年 iStig. All rights reserved.
//

import UIKit

class UserInfoManager: NSObject {
  private static let sharedInstance = UserInfoManager()
  var userPosition:CLLocationCoordinate2D?
  private lazy var locationManager:CLLocationManager = {
  let locationManager = CLLocationManager()
    locationManager.delegate = self
    locationManager.requestAlwaysAuthorization()
    return locationManager
  }()
  
  class var sharedUserInfoManager:UserInfoManager {
    return sharedInstance
  }
  
  /// 获取用户位置授权,定位用户当前坐标
  func startUserlocation() {
    locationManager.autoContentAccessingProxy
    locationManager.startUpdatingLocation()
  }
}

extension UserInfoManager:CLLocationManagerDelegate {
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let user = locations[0] as CLLocation
    userPosition = user.coordinate
    locationManager.stopUpdatingHeading()
  }
}
