//
//  HomeWeiboImageView.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboImageView: UIImageView {
    
    //设置微博首页图片
    class func setImageView (imageName : String ) -> UIImageView {
        return UIImageView( image: UIImage(named: imageName ))
    }
}
