//
//  UserInfoModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/5.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject, NSCoding {
    
    var access_token        : String?//用于调用access_token，接口获取授权后的access token。
    //access_token的生命周期，单位是秒数。
    var expires_in          : NSTimeInterval = 0 {
        didSet {
            self.expires_date = NSDate(timeIntervalSinceNow: Double(expires_in))
        }
    }
    var expires_date        : NSDate?//保存用户过期时间
    var uid                 : String?//当前授权用户的UID。
    var name                : String?//友好显示名称
    var avatar_large        : String? //用户头像地址（大图），180×180像素
    
    static var isLoadData : UserInfoModel?  = nil//是否登录
    static let user_info_plist              = "user_info.plist".getCacheDir()//获得归档文件目录
    static let appId                        = "2461372076"//开发者id
    static let redirectUrl                  = "http://blog.womenshuo.com" //跳转地址
    static let appSecret                    = "338fd3997b0291d0a82b5a3a824fdb05"//秘钥
    static let grantType                    = "authorization_code"//授权类型
    static let getTokenUrl                  = "oauth2/access_token"//获得Token Url
    static let getUserInfoUrl               = "2/users/show.json"//获得用户信息Url
    
    //MARK: init方法
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    //MARK: 忽略不存在的模型属性
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    //MARK: 描述
    override var description: String {
        let keys = ["access_token", "expires_in", "uid", "name", "avatar_large", "expires_date"]
        return dictionaryWithValuesForKeys(keys).description
    }
    
    //MARK: 获得token
    class func getToken (code : String) {
        let params = ["client_id" : appId, "client_secret" : appSecret, "grant_type" : grantType, "code" : code, "redirect_uri" : redirectUrl]
        NetworkTools.shareNetWorkToole().POST(getTokenUrl, parameters: params, success: { (_, result) -> Void in
            print(result)
            if let dict = result as? [String : AnyObject] {
                let userInfo = UserInfoModel(dict: dict)
                //获得用户信息
                getUserInfo(userInfo)
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    //MARK: 获得用户信息
    class func getUserInfo(userInfo : UserInfoModel){
        print(userInfo)
        let params      = ["access_token" : userInfo.access_token!, "uid" : userInfo.uid!]
        NetworkTools.shareNetWorkToole().GET(getUserInfoUrl, parameters: params, success: { (_, result) -> Void in
            if let dict = result as? [String : AnyObject] {
                userInfo.name           = dict["name"] as? String
                userInfo.avatar_large   = dict["avatar_large"] as? String
                //归档数据
                userInfo.saveData()
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    //MARK: 是否登录
    class func isLogin() -> Bool {
        return UserInfoModel.loadData() != nil ? true : false
    }
    
    //MARK: 归档
    func saveData(){
        NSKeyedArchiver.archiveRootObject(self, toFile: UserInfoModel.user_info_plist)
    }
    
    //MARK: 解归档
    class func loadData() -> UserInfoModel?{
        
        if (self.isLoadData == nil) {
            self.isLoadData = NSKeyedUnarchiver.unarchiveObjectWithFile(UserInfoModel.user_info_plist) as? UserInfoModel
        }
        
        //判断授权是否过期
        if self.isLoadData?.expires_date?.compare(NSDate()) == .OrderedAscending{
            return nil
        }
        
        return self.isLoadData
    }
    
    //MARK: 归档
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.access_token, forKey: "access_token")
        aCoder.encodeObject(self.expires_in, forKey: "expires_in")
        aCoder.encodeObject(self.expires_date, forKey: "expires_date")
        aCoder.encodeObject(self.uid, forKey: "uid")
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.avatar_large, forKey: "avatar_large")
    }
    
    //MARK: 接归档
    required init?(coder aDecoder: NSCoder){
        self.access_token   = aDecoder.decodeObjectForKey("access_token") as? String
        self.expires_in     = (aDecoder.decodeObjectForKey("expires_in") as? NSTimeInterval)!
        self.expires_date   = (aDecoder.decodeObjectForKey("expires_date")) as? NSDate
        self.uid            = aDecoder.decodeObjectForKey("uid") as? String
        self.name           = aDecoder.decodeObjectForKey("name") as? String
        self.avatar_large   = aDecoder.decodeObjectForKey("avatar_large") as? String
    }
}
