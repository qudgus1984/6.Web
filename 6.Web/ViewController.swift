//
//  ViewController.swift
//  6.Web
//
//  Created by 이병현 on 2022/03/29.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url) // 상수 myUrl은 url 값을 받아 URL 형으로 선언
        let myRequest = URLRequest(url: myUrl!) // 상수 myRequest는 상수 myUrl을 받아 Request 형으로 선언
        myWebView.load(myRequest) // UIWebView형의 mtWebView 클래스의 load 메서드를 호출함
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://blog.naver.com/qudgus1984")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url                        // 입력받은 url 스트링을 임시변수 strUrl에 넣음
        let flag = strUrl.hasPrefix("http://")  // "http://"를 가지고 있는지 확인한 값을 flag에 넣음
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl                           // "http://" 를 가지고 있지 않다면 변수 strUrl에 http:// 를 추가하고 리턴함
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://github.com/qudgus1984")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://github.com/qudgus1984")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http:\\blog.naver.com/qudgus1984\">qudgus1984</a>으로 이동</p>" // HTML문 변수에 저장
        myWebView.loadHTMLString(htmlString, baseURL: nil) // loadHTMLString 함수를 이용하여 변수에 저장된 HTML문을 나타냄
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
                                                    // htmlView.html의 파일에 대한 패스 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!) // 패스 변수를 이용하여 URL 변수 생성
        let myRequest = URLRequest(url: myUrl)      // URL 변수를 이용하여 Request 변수 생성
        myWebView.load(myRequest)                  // Request 변수를 이용하여 HTML 파일을 로딩함
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 웹 페이지의 로딩을 중지시키는 함수 호출
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() // 웹 페이지를 재로딩 시키는 함수 호출
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() // 이전 웹 페이지로 이동시키는 함수 호출
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() // 다음 웹 페이지로 이동시키는 함수 호출
    }
    
}

