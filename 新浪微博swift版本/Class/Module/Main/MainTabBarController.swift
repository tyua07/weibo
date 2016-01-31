//
//  MainTabBarController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/30.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    //MARK: 发送微博按钮点击事件
    @objc private func composeClick (){
        print(__FUNCTION__)
    }
    
    override func viewDidLoad() {
        
        let mainTabBar = MainTabBar()
        
        //自定义当前TabBar
        setValue(mainTabBar, forKey: "tabBar")
        
        super.viewDidLoad()
        //添加子视图控制器
        self.addChildController()
        
        //给发送微博按钮点击事件
        mainTabBar.composeBtn.addTarget(self, action: "composeClick", forControlEvents: .TouchUpInside)
    }
    
    
    
    //MARK: 添加子视图控制器
    private func addChildController(){
        addChildViewController(HomeTableViewController(), title: "首页", image: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", image: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", image: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", image: "tabbar_profile")
    }
    
    //MARK: 添加单个子视图
    private func addChildViewController(vc: UIViewController, title: String, image:String){
        
        let nav = UINavigationController(rootViewController: vc)
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: image + "_highlighted")?.imageWithRenderingMode(.AlwaysOriginal)
    
        
        addChildViewController(nav)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
