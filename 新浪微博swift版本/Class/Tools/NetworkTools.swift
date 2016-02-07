//
//  NetworkTools.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/7.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {

    static let netWorkTools : NetworkTools = {
        let n = NetworkTools(baseURL:  NSURL(string : "https://api.weibo.com/"))
        n.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return n
    }()
    
    class func shareNetWorkToole () -> NetworkTools {
        return netWorkTools
    }
}
