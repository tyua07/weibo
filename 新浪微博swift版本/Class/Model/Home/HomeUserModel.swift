//
//  HomeUserModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/8.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeUserModel: NSObject {
    
    var id : Int = 0 //用户UID
    var screen_name : String? //用户昵称
    var name : String? //友好显示名称
    var profile_image_url : String?//用户头像地址（中图），50×50像素
    var verified_reason : Int?//认证原因
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        let dict = ["id", "screen_name", "name", "profile_image_url", "verified_reason"]
        return "\(dictionaryWithValuesForKeys(dict))"
    }
    
}
