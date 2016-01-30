//
//  MainTabBarController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/30.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        let mainTabBar = MainTabBar()
        
        setValue(mainTabBar, forKey: "tabBar")
        
        super.viewDidLoad()

        //添加子视图控制器
        self.addChildController()
    }
    
    //添加子视图控制器
    private func addChildController(){
        
        addChildViewController(HomeTableViewController(), title: "首页", image: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", image: "tabbar_message_center")
        addChildViewController(DiscoverTableViewController(), title: "发现", image: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", image: "tabbar_profile")
    }
    
    // 添加单个子视图
    private func addChildViewController(vc: UIViewController, title: String, image:String){
        
        //设置字体颜色
        self.tabBar.tintColor = UIColor.orangeColor()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
