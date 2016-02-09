//
//  HomeTableViewController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/1/30.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit

//cell id
let cellIdentified = "cellID"

class HomeTableViewController : BaseTableViewController {
    
    var cellArray : [String : AnyObject]?

    var weiboData : [HomeWeiboListModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    //MARK: 重写viewDidLoad方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加载微博数据
        if UserInfoModel.isLogin() == true {
            HomeWeiboListModel.loadWeiboListData { (homeWeiboModels, error) -> () in
                self.weiboData = homeWeiboModels
            }
        }
        
        //设置代理和数据源
        self.tableView.dataSource   = self
        self.tableView.delegate     = self
        self.tableView.registerClass(HomeWeiboTableCell.self, forCellReuseIdentifier: cellIdentified)
        
        //设置table属性
        //self.tableView.estimatedRowHeight = 200//最小行高
        //self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = 250
    }
    
    
    
}



//设置tableView 代理 和 数据源
extension HomeTableViewController{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weiboData?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentified, forIndexPath:  indexPath) as! HomeWeiboTableCell
        
        cell.data = self.weiboData![indexPath.row]
//        //强制布局
//        cell.layoutIfNeeded()
//        print(cell.frame.size.height)
//        //self.cellArray[indexPath.row] = cell.height as! CGFloat
        return cell
    }

    
}
