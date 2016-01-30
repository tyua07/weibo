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
        
        print(self.subviews)
    }

    //设置按钮
    private func setBtn(){
        addSubview(composeBtn)
    }
    
    var composeBtn: UIButton {
        let btn = UIButton()
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState: .Highlighted)
        
        btn.sizeToFit()
        return btn
    }
}
