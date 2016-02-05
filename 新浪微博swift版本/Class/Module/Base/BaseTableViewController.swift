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
        userIsLogin == true ? super.loadView() : self.setNoLoginView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "register")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "login")
    }
    
    //MARK: 登录
    func login() {
        let nv = UINavigationController(rootViewController: OAuthViewController())
        presentViewController(nv, animated: true, completion: nil)
    }
    
    //MARK: 注册
    func register() {
        print("register")
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
}
