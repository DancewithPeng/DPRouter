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
        DPRouter.shared.register(ArticleListViewController.self)
        DPRouter.shared.register(ArticleDetailViewController.self)
    }
}
