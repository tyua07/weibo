//
//  NavigationBar+extend.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/6.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    
    //MARK: 创建自定义barbuttonitem
    class func createBarButtonItem(btnImage: String, targer: AnyObject, action: Selector) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: btnImage), forState: .Normal)
        btn.setImage(UIImage(named: btnImage + "_highlighted") , forState: .Normal)
        btn.sizeToFit()
        btn.addTarget(targer, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: btn);
    }
    
}
