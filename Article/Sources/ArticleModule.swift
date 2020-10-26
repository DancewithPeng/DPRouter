//
//  ArticleModule.swift
//  Article
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPModuleManager
import DPRouter

class ArticleModule: Module {
    
    override func didLoad() {
        super.didLoad()
        
        DPRoute("sub.myhost.com/articles", ArticleListViewController.self)
        DPRoute("sub.myhost.com/articles/detail", ArticleDetailViewController.self)
    }
}
