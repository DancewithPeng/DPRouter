//
//  ArticleListViewController.swift
//  Article
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPRouter

class ArticleListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "文章"
        navigationItem.title = "文章列表"        
    }
    
    @IBAction func detailButtonDidTap(_ sender: Any) {
        Router.shared.route(to: "sub.myhost.com/articles/detail")
    }
}

extension ArticleListViewController: Router.PageProvider {
    
    static func page(for url: URL) -> UIViewController? {
        
        let articlePage = ArticleListViewController(nibName: "ArticleListViewController", bundle: Bundle(for: ArticleListViewController.self))
        
        if let navParam = url.queries?["nav"],
           let needsNav = Int(navParam),
           needsNav == 1 {
            return UINavigationController(rootViewController: articlePage)
        } else {
            return articlePage
        }
    }
}
