//
//  HomeWeiboUIButton.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboUIButton: UIButton {
    
    //MARK: 设置按钮
    class func setButton (titel : String, imageName : String) -> UIButton {
        let btn = UIButton()
        
        btn.setTitle(titel, forState: .Normal)
        btn.setImage( UIImage(named: imageName), forState: .Normal)
        
        return btn
    }
    
}
