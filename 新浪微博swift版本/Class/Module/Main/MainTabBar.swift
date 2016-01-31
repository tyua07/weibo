//
//  MainTabBar.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/30.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //设置按钮
        self.setBtn()
    }

    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        //设置按钮
        self.setBtn()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //手动修改所有按钮的位置
        
        let width = self.bounds.width / 5
        let height = self.bounds.height
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        var index:CGFloat = 0//索引
        for subview in self.subviews {
            if subview.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                subview.frame = CGRectOffset(rect, width * index, 0)
                //设置按钮
                index = index == 1 ? index + 2 : index + 1
            }
        }
        
        composeBtn.frame = CGRectOffset(rect, width * 2, -20)
        bringSubviewToFront(composeBtn)
    }

    //MARK: 添加按钮
    private func setBtn(){
        addSubview(composeBtn)
    }
    
    //MARK: 懒加载 中间按钮
    lazy var composeBtn: UIButton = {
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        
        btn.sizeToFit()
        return btn
    }()
    
}
