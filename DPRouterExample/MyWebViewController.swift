//
//  MyWebViewController.swift
//  DPRouterExample
//
//  Created by 张鹏 on 2020/10/31.
//

import UIKit
import DPRouter
import WebKit

class MyWebViewController: UIViewController, Router.PageProvider {
    
    lazy var webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    var url: URL
    
    static func page(for url: URL) -> UIViewController? {
        return MyWebViewController(url: url)
    }
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.leadingAnchor.constraint(equalTo  : view.leadingAnchor).isActive  = true
        webView.trailingAnchor.constraint(equalTo : view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo      : view.topAnchor).isActive      = true
        webView.bottomAnchor.constraint(equalTo   : view.bottomAnchor).isActive   = true
        
        webView.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
