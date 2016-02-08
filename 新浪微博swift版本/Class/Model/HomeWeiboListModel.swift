//
//  HomeWeiboListModel.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/8.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboListModel: NSObject {
    var created_at : String? //微博创建时间
    var id: Int = 0//微博ID
    var text : String?//微博信息内容
    var pic_ids : [String: AnyObject]?//微博配图ID。多图时返回多图ID，用来拼接图片url。用返回字段thumbnail_pic的地址配上该返回字段的图片ID，即可得到多个图片url。
    
    init(dict: [String : AnyObject] ) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    //MARK: 加载微博数据
    class func loadWeiboListData() {
        let param : [String : AnyObject] = ["access_token" : UserInfoModel.loadData()!.access_token!]
        
        NetworkTools.shareNetWorkToole().GET("2/statuses/home_timeline.json", parameters: param, success: { (_, result) -> Void in
            setHomeWeiboListModel(result!["statuses"] as! [[String: AnyObject]])
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    //MARK: 设置模型
    class func setHomeWeiboListModel(dictArray : [[String : AnyObject]] ) -> [HomeWeiboListModel] {
        var array = [HomeWeiboListModel]()
        
        for dict in dictArray {
            array.append(HomeWeiboListModel(dict : dict ))
        }
        print(array)
        return array
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override var description: String {
        let dict = ["created_at", "id", "text", "pic_ids"]
        return "\(dictionaryWithValuesForKeys(dict))"
    }
}
