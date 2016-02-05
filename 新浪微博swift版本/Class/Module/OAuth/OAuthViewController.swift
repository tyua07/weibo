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
    let appId       = "2461372076"
    let redirectUrl = "http://blog.womenshuo.com"
    let appSecret   = "338fd3997b0291d0a82b5a3a824fdb05"
    let grantType   = "authorization_code"
    
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
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://api.weibo.com/oauth2/authorize?client_id=\(self.appId)&redirect_uri=\(self.redirectUrl)")!))
        
    }
    
    //MARK: 设置UI
    private func setupUI(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "close")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .Plain, target: self, action: "autoComplete")
    }
    
    //MARK: 关闭
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
        
        if !url.hasPrefix("\(redirectUrl)") {
            return false
        }
        
        guard let query = request.URL?.query else {
            return false
        }
        
        let codeQuery = "code="
        let code = query.substringFromIndex(codeQuery.endIndex)
        //获得token
        self.getToken(code)
        return true
    }
    
    //MARK: 获得token
    private func getToken (code : String) {
        let AFN    = AFHTTPSessionManager()
        let params = ["client_id" : self.appId, "client_secret" : self.appSecret, "grant_type" : self.grantType, "code" : code, "redirect_uri" : self.redirectUrl]
        AFN.responseSerializer.acceptableContentTypes?.insert("text/plain")
        AFN.POST("https://api.weibo.com/oauth2/access_token", parameters: params, success: { (_, result) -> Void in
            if let dict = result as? [String : AnyObject] {
                var userInfo = UserInfoModel(dict: dict)
                //获得用户信息
                self.getUserInfo(userInfo)
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    //MARK: 获得用户信息
    private func getUserInfo(userInfo : UserInfoModel){
        let AFN         = AFHTTPSessionManager()
        let params      = ["access_token" : userInfo.access_token!, "uid" : userInfo.uid!]
        
        
        AFN.GET("https://api.weibo.com/2/users/show.json", parameters: params, success: { (_, result) -> Void in
            if let dict = result as? [String : AnyObject] {
                userInfo.name           = dict["name"] as? String
                userInfo.avatar_large   = dict["avatar_large"] as? String
                
                print(userInfo)
            }
            
            }) { (_, error) -> Void in
                print(error)
        }
    }
    
    func webViewDidStartLoad(webView: UIWebView){
        SVProgressHUD.show()
    }
    
    func webViewDidFinishLoad(webView: UIWebView){
        SVProgressHUD.dismiss()
    }
}