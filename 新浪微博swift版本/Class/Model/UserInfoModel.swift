//
//  UserInfoModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/5.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject, NSCoding {
    
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
    
    //MARK: 归档
    func saveData(){
        NSKeyedArchiver.archiveRootObject(self, toFile: "user_info.plist".getCacheDir())
    }
    
    //MARK: 解归档
    class func loadData() -> UserInfoModel?{
        let userInfo = NSKeyedUnarchiver.unarchiveObjectWithFile("user_info.plist".getCacheDir()) as? UserInfoModel
        return userInfo
    }
    
    //MARK: 归档
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.access_token, forKey: "access_token")
        aCoder.encodeObject(self.expires_in, forKey: "expires_in")
        aCoder.encodeObject(self.uid, forKey: "uid")
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.avatar_large, forKey: "avatar_large")
    }
    
    //MARK: 接归档
    required init?(coder aDecoder: NSCoder){
        self.access_token   = aDecoder.decodeObjectForKey("access_token") as? String
        self.expires_in     = (aDecoder.decodeObjectForKey("expires_in") as? NSTimeInterval)!
        self.uid            = aDecoder.decodeObjectForKey("uid") as? String
        self.name           = aDecoder.decodeObjectForKey("name") as? String
        self.avatar_large   = aDecoder.decodeObjectForKey("avatar_large") as? String
    }
}
