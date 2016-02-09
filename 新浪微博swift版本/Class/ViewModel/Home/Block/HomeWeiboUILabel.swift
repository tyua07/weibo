//
//  HomeWeiboUILabel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboUILabel: UILabel {

    //设置首页微博 label
    class func setLabel(title : String, font : UIFont) -> UILabel {
        let l       = UILabel()
        l.textColor = UIColor.darkGrayColor()
        l.font      = font
        //设置label 文本内容
        l.text      = title
        l.sizeToFit()
        return l
    }
}
