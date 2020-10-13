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
        
        mainTabBarController.viewControllers = []

        guard let articlePage = DPRouter.shared.page(for: "https://sub.myhost.com/articles?nav=1&name=123&temp=") else {
            return
        }
        
        guard let questionPage = DPRouter.shared.page(for: "https://sub.myhost.com/questions?nav=1") else {
            return
        }
        
        guard let topicPage = DPRouter.shared.page(for: "https://sub.myhost.com/topics?nav=1") else {
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
    }
}

