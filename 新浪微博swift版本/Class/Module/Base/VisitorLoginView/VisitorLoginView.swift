//
//  VisitorLoginView.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/31.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate: NSObjectProtocol{
    //MARK: 登录协议
    func login()
    //MARK: 注册协议
    func register()
}

class VisitorLoginView: UIView {

    //申明代理属性
    
    weak var visitorViewDelegate: VisitorViewDelegate?
    
    //MARK: 登录方法
    @objc func loginDidClick(){
        visitorViewDelegate?.login()
    }
    
    //MARK: 注册方法
    @objc func registerDidClick(){
        visitorViewDelegate?.register()
    }
    
    //MARK: 重写init方法
    override init(frame: CGRect) {
        super.init(frame: CGRectZero)
        
        //设置UI
        self.setUpUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 设置 视图标题和图片名称
    func setVisitor(title: String?, imageName: String){
        //默认设置 iconView 为 hidden
        self.iconView.hidden = false
        
        if title != nil {
            self.iconView.hidden = true
        }
        self.tipLable.text          = title
        self.circleView.image       = UIImage(named: imageName)
    }
    
    //MARK: 设置UI
    private func setUpUI(){
        
        self.addSubview(circleView)
        self.addSubview(iconView)
        self.addSubview(tipLable)
        self.addSubview(loginBtn)
        self.addSubview(registerBtn)

        
        //设置全部视图失效
        for subView in subviews {
            subView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //设置视图约束
        addConstraints([
                NSLayoutConstraint(item: circleView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: circleView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -60),
        ])
        
        //设置视图约束
        addConstraints([
            NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: circleView, attribute: .CenterY, multiplier: 1.0, constant: 0),
        ])
        
        //设置视图约束
        addConstraints([
                NSLayoutConstraint(item: tipLable, attribute: .CenterX, relatedBy: .Equal, toItem: circleView, attribute: .CenterX, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: tipLable, attribute: .Top, relatedBy: .Equal, toItem: circleView, attribute: .Bottom, multiplier: 1.0, constant: 16),
                NSLayoutConstraint(item: tipLable, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant:224),
        ])
        
        //设置视图约束
        addConstraints([
            NSLayoutConstraint(item:loginBtn, attribute: .Left, relatedBy: .Equal, toItem: tipLable, attribute: .Left, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:loginBtn, attribute: .Top, relatedBy: .Equal, toItem: tipLable, attribute: .Bottom, multiplier: 1.0, constant: 16),
            NSLayoutConstraint(item:loginBtn, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 100),
            NSLayoutConstraint(item:loginBtn, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 35),
        ])
        
        //设置视图约束
        addConstraints([
            NSLayoutConstraint(item:registerBtn, attribute: .Right, relatedBy: .Equal, toItem: tipLable, attribute: .Right, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:registerBtn, attribute: .CenterY, relatedBy: .Equal, toItem: loginBtn, attribute: .CenterY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:registerBtn, attribute: .Width, relatedBy: .Equal, toItem: loginBtn, attribute: .Width, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item:registerBtn, attribute: .Height, relatedBy: .Equal, toItem: loginBtn, attribute: .Height, multiplier: 1.0, constant: 0),
        ])
        
        //设置登录事件
        loginBtn.addTarget(self, action: "loginDidClick", forControlEvents: .TouchUpInside)
        //设置注册事件
        registerBtn.addTarget(self, action: "registerDidClick", forControlEvents: .TouchUpInside)
    }
    
    
    private lazy var circleView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
    //提示文字
    private lazy var tipLable:UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.lightGrayColor()
        label.sizeToFit()
        label.numberOfLines = 0
        
        return label
    }()
    
    //登录按钮
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("登录", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        
        return btn
    }()
    
    //注册按钮
    private lazy var registerBtn: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("注册", forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        
        return btn
    }()

}
