//
//  HomeWeiboTableCell.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/9.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class HomeWeiboTableCell: UITableViewCell {
    
    //微博数据
    var data : HomeWeiboListModel?  {
        didSet {
            userName.text   = data?.user?.name
            content.text    = data?.text
        }
    }
    
    //MARK: 重写初始化方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //设置UI
        self.setupUI()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 设置UI
    private func setupUI() {
        contentView.addSubview(face)
        contentView.addSubview(icon)
        contentView.addSubview(userName)
        contentView.addSubview(memberIcon)
        contentView.addSubview(time)
        contentView.addSubview(source)
        contentView.addSubview(content)
        contentView.addSubview(footerView)
        
        //设置视图约束
        self.setLayOut()
    }
    
    //MARK: 设置视图约束
    private func setLayOut () {
        
        for subView in contentView.subviews {
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //设置头像视图约束
        addConstraints([
            NSLayoutConstraint(item: face, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: face, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 10),
        ])
        
        //设置认证图标约束
        addConstraints([
            NSLayoutConstraint(item: icon, attribute: .Top, relatedBy: .Equal, toItem: face, attribute: .Bottom, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: icon, attribute: .Left, relatedBy: .Equal, toItem: face, attribute: .Right, multiplier: 1, constant: -10),
        ])
        
        //设置昵称约束
        addConstraints([
            NSLayoutConstraint(item: userName, attribute: .Top, relatedBy: .Equal, toItem: face, attribute: .Top, multiplier: 1, constant: 5),
            NSLayoutConstraint(item: userName, attribute: .Left, relatedBy: .Equal, toItem: face, attribute: .Right, multiplier: 1, constant: 20),
        ])
        
        //设置会员图标约束
        addConstraints([
            NSLayoutConstraint(item: memberIcon, attribute: .Top, relatedBy: .Equal, toItem: userName, attribute: .Top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: memberIcon, attribute: .Left, relatedBy: .Equal, toItem: userName, attribute: .Right, multiplier: 1, constant: 10),
        ])
        
        //设置时间约束
        addConstraints([
            NSLayoutConstraint(item: time, attribute: .Top, relatedBy: .Equal, toItem: userName, attribute: .Bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: time, attribute: .Left, relatedBy: .Equal, toItem: userName, attribute: .Left, multiplier: 1, constant: 0),
        ])
        
        //设置来源约束
        addConstraints([
            NSLayoutConstraint(item: source, attribute: .Top, relatedBy: .Equal, toItem: time, attribute: .Top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: source, attribute: .Left, relatedBy: .Equal, toItem: time, attribute: .Right, multiplier: 1, constant: 10),
        ])
        
        //设置正文约束
        addConstraints([
            NSLayoutConstraint(item: content, attribute: .Top, relatedBy: .Equal, toItem: face, attribute: .Bottom, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: content, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: content, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: -10),
            NSLayoutConstraint(item: content, attribute: .Left, relatedBy: .Equal, toItem: face, attribute: .Left, multiplier: 1, constant: 0)
        ])
        
        //设置底部工具条约束
        addConstraints([
            NSLayoutConstraint(item: footerView, attribute: .Top, relatedBy: .Equal, toItem: content, attribute: .Bottom, multiplier: 1, constant: 10),
            NSLayoutConstraint(item: footerView, attribute: .Right, relatedBy: .Equal, toItem: contentView, attribute: .Right, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: footerView, attribute: .Bottom, relatedBy: .Equal, toItem: contentView, attribute: .Bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: footerView, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: footerView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: UIScreen.mainScreen().bounds.width - 20),
            NSLayoutConstraint(item: footerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 44)
        ])
        
    }
    
    private lazy var face : UIImageView                 = HomeWeiboImageView.setImageView("avatar_default_small")//设置头像
    private lazy var icon : UIImageView                 = HomeWeiboImageView.setImageView("avatar_grassroot")//设置认证图标
    private lazy var userName : UILabel                 = HomeWeiboUILabel.setLabel("", font : UIFont.systemFontOfSize(14) )//设置昵称
    private lazy var memberIcon : UIImageView           = HomeWeiboImageView.setImageView("common_icon_membership_level1")//设置会员图标
    private lazy var time : UILabel                     = HomeWeiboUILabel.setLabel("刚刚", font : UIFont.systemFontOfSize(12) )//设置时间
    private lazy var source : UILabel                   = HomeWeiboUILabel.setLabel("微博首页", font : UIFont.systemFontOfSize(12) )//设置来源
    private lazy var content : UILabel                  = ContentUILabel.setLabel()//设置微博内容
    private lazy var footerView : HomeWeiboFooterView   = HomeWeiboFooterView()//设置工具栏
    

    
}


