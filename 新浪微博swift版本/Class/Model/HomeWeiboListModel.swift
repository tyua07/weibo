//
//  HomeWeiboListModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/8.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboListModel: NSObject {
    
    var created_at  : String? //微博创建时间
    var id          : Int = 0//微博ID
    var text        : String?//微博信息内容
    var pic_ids     : [String: AnyObject]?//微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
    var user        : HomeUserModel?//当前微博用户模型
    
    static let get_weibo_data_url: String = "2/statuses/home_timeline.json"//获取微博数据 Url Path
    
    init(dict: [String : AnyObject] ) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    //MARK: 重写 设置value方法
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    
        if key == "user" {
            self.user = HomeUserModel(dict : value as! [String : AnyObject])
        }
    }
    
    //MARK: 加载微博数据
    class func loadWeiboListData(finished :  ( homeWeiboModels : [HomeWeiboListModel]?, error : NSError? ) -> ()) {
        let param : [String : AnyObject] = ["access_token" : UserInfoModel.loadData()!.access_token!]
        
        NetworkTools.shareNetWorkToole().GET(self.get_weibo_data_url, parameters: param, success: { (_, result) -> Void in
            let homeWeiboModels = setHomeWeiboListModel(result!["statuses"] as! [[String: AnyObject]])
            
            finished(homeWeiboModels : homeWeiboModels, error : nil)
            
            }) { (_, error) -> Void in
                finished(homeWeiboModels: nil, error: error)
        }
    }
    
    //MARK: 设置模型
    class func setHomeWeiboListModel(dictArray : [[String : AnyObject]] ) -> [HomeWeiboListModel] {
        var array = [HomeWeiboListModel]()
        
        for dict in dictArray {
            array.append(HomeWeiboListModel(dict : dict ))
        }
        return array
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        let dict = ["created_at", "id", "text", "pic_ids"]
        return "\(dictionaryWithValuesForKeys(dict))"
    }
}
