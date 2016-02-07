//
//  TitleButton.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/6.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: .Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: .Selected)
        setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        self.sizeToFit()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}




