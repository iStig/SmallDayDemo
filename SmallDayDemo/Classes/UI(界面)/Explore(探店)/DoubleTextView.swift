//
//  DoubleTextView.swift
//  SmallDayDemo
//
//  Created by iStig on 16/3/8.
//  Copyright © 2016年 iStig. All rights reserved.
//

import UIKit

class DoubleTextView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}


//没有高亮状态的按钮
class NoHighlightButton:UIButton {
  //重写sethighlighted方法 无论怎么设置都是不显示highlighted状态
  override var highlighted: Bool {
    didSet{
      super.highlighted = false
    }
  }
}