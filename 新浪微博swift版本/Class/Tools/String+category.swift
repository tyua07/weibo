//
//  String+category.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/5.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

extension String {
    
    //MARK: 返回 Cache 文件夹目录
    func getCacheDir() -> String{
        let path = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).last! as NSString
        return path.stringByAppendingPathComponent(self)
    }
    //MARK: 返回 Document 文件夹目录
    func getDocumentDir() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last! as NSString
        return path.stringByAppendingPathComponent(self)
    }
    
    //MARK: 获得 Tmp 文件夹目录
    func getTmpDir() -> String {
        let path = NSTemporaryDirectory() as NSString
        return path.stringByAppendingPathComponent(self)
    }
}
