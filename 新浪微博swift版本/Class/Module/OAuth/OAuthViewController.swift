//
//  OAuthViewController.swift
//  新浪微博swift版本
//
//  Created by yangyifan on 16/2/4.
//  Copyright © 2016年 weibo. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking

class OAuthViewController: UIViewController {
    
    
    let webView     = UIWebView()
    
    //MARK: 重新loadView
    override func loadView() {
        view = webView
    }
    
    //MARK: 重写viewDidLoad 方法
    override func viewDidLoad() {
        super.viewDidLoad()
        //定义webview代理
        self.webView.delegate = self
        //设置
        self.setupUI()
        //设置webview
        self.loadOAuthPage()
    }
    
    //MARK: 设置webview
    private func loadOAuthPage(){
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(UserInfoModel.appId)&redirect_uri=\(UserInfoModel.redirectUrl)")!))
        
    }
    
    //MARK: 设置UI
    private func setupUI(){
        navigationItem.leftBarButtonItem    = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "close")
        navigationItem.rightBarButtonItem   = UIBarButtonItem(title: "自动填充", style: .Plain, target: self, action: "autoComplete")
    }
    
    //MARK: 关闭 WebView
    @objc private func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: 自动填充
    @objc private func autoComplete(){
        let javascript = "document.getElementById('userId').value = '547484196@qq.com';"
        self.webView.stringByEvaluatingJavaScriptFromString(javascript)
    }
    
}

extension OAuthViewController : UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool{
        
        guard let url = request.URL?.absoluteString else {
            return false
        }
        
        if url.hasPrefix("https://api.weibo.com/oauth2/authorize") {
            return true
        }
        
        if !url.hasPrefix("\(UserInfoModel.redirectUrl)") {
            return false
        }
        
        guard let query = request.URL?.query else {
            return false
        }
        
        let codeQuery = "code="
        let code = query.substringFromIndex(codeQuery.endIndex)
        //获得token
        UserInfoModel.getToken(code)
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView){
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView){
        SVProgressHUD.dismiss()
    }
}