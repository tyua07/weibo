//
//  BaseTableViewController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/31.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, VisitorViewDelegate {
    
    var visitorView: VisitorLoginView?
    
    //是否登录状态
    var userIsLogin = false
    
    //MARK: 重写loadView
    override func loadView() {
        super.loadView()
        
        if (userIsLogin != true) {
            self.setNoLoginView()
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "register")
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "login")
            return
        }
        super.loadView()
        //设置UI
        self.setupUI()
        
    }
    
    //MARK: 设置UI
    private func setupUI(){
        navigationItem.leftBarButtonItem    = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention", targer: self, action: "leftBarButtonClick")
        navigationItem.rightBarButtonItem   = UIBarButtonItem.createBarButtonItem("navigationbar_pop", targer: self, action: "rightBarButtonClick")
        
        let titleBtn = TitleButton()
        titleBtn.setTitle("杨一繁 ", forState: .Normal)
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    @objc private func titleBtnClick(btn: UIButton){
        btn.selected = !btn.selected
    }
    
    @objc private func leftBarButtonClick() {
        print(__FUNCTION__)
    }
    
    @objc private func rightBarButtonClick() {
        print(__FUNCTION__)
    }
    
    //MARK: 登录
    func login() {
        let nv = UINavigationController(rootViewController: OAuthViewController())
        presentViewController(nv, animated: true, completion: nil)
    }
    
    //MARK: 注册
    func register() {
        print(UserInfoModel.loadData())
    }
    
    //MARK: 设置未登录时的视图
    private func setNoLoginView(){
        self.visitorView = VisitorLoginView()
        //设置代理
        self.visitorView?.visitorViewDelegate = self
        self.view = self.visitorView
    }
    
    //MARK: 重写viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
