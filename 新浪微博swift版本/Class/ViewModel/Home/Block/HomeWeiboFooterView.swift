//
//  HomeWeiboFooterView.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit
import SnapKit

class HomeWeiboFooterView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置UI
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 设置UI
    private func setupUI() {
        self.addSubview(retweet)
        self.addSubview(common)
        self.addSubview(unlike)
        
        //设置约束
        self.setLatOut()
    }
    
    //MARK: 设置约束
    func setLatOut() {
        //设置转发约束
        retweet.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(self.frame.size.height)//设置高度
            make.width.equalTo(self.frame.size.width / CGFloat(self.subviews.count) )//设置宽度
            print(self.frame)
        }
        
        //设置评论约束
        common.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(retweet)
        }
        
        //设置赞约束
        unlike.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(retweet)
        }
    }
    
    private lazy var retweet: UIButton  = HomeWeiboUIButton.setButton("转发", imageName : "timeline_icon_retweet")//MARK: 转发按钮
    private lazy var common: UIButton   = HomeWeiboUIButton.setButton("评论", imageName: "timeline_icon_comment")//MARK: 评论按钮
    private lazy var unlike : UIButton  = HomeWeiboUIButton.setButton("赞", imageName : "timeline_icon_unlike")//MARK: 赞按钮
    
}
