//
//  UserInfoModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/5.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject {
    
    var access_token : String?//用于调用access_token，接口获取授权后的access token。
    var expires_in : NSTimeInterval = 0 //access_token的生命周期，单位是秒数。
    var uid : String?//当前授权用户的UID。
    var name : String?//友好显示名称
    var avatar_large : String? //用户头像地址（大图），180×180像素
    
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        let keys = ["access_token", "expires_in", "uid", "name", "avatar_large"]
        return dictionaryWithValuesForKeys(keys).description
    }
}
