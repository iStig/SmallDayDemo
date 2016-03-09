//
//  UIColor+sdColor.swift
//  SmallDayDemo
//
//  Created by iStig on 16/3/9.
//  Copyright © 2016年 iStig. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  class func colorWith(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
    let color = UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    return color
  }
}