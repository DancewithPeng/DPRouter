//
//  ViewController.swift
//  DPRouterExample
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPRouter

class RootViewController: UIViewController {
    
    lazy var mainTabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Router.shared.defaultRoutePolicy = Router.ShowOnCurrentPageRoutePolicy.policy()
        Router.ResourceDespatcher.shared.defaultPageProvider = MyWebViewController.self
        
        guard let articlePage = Router.ResourceDespatcher.shared.page(for: "https://sub.myhost.com/articles?nav=1&name=123&temp=") else {
            return
        }
        
        guard let questionPage = Router.ResourceDespatcher.shared.page(for: "https://sub.myhost.com/questions?nav=1") else {
            return
        }
        
        guard let topicPage = Router.ResourceDespatcher.shared.page(for: "https://sub.myhost.com/topics?nav=1") else {
            return
        }
        
        mainTabBarController.viewControllers = [articlePage, questionPage, topicPage]
        
        self.addChild(mainTabBarController)
        
        view.addSubview(mainTabBarController.view)
        mainTabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        mainTabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainTabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainTabBarController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        mainTabBarController.didMove(toParent: self)
        
        print(URL("https://www.baidu.com/aaa/bbb/ccc?hello=world").resourceName)
    }
}

