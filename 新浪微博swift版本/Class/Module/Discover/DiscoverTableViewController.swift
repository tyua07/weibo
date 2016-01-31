//
//  DiscoverTableViewController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/30.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

class DiscoverTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.visitorView?.setVisitor("登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过", imageName: "visitordiscover_image_message")
    }
}
