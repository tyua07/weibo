//
//  ContentUILabel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class ContentUILabel: UILabel {
    
    //设置微博内容
    class func setLabel () -> UILabel {
        let l                       = UILabel()
        l.font                      = UIFont.systemFontOfSize(14)
        l.textColor                 = UIColor.darkGrayColor()
        l.preferredMaxLayoutWidth   = UIScreen.mainScreen().bounds.width - 20
        l.numberOfLines             = 0
        return l
    }
}
