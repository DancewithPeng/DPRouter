//
//  ArticleDetailViewController.swift
//  Article
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPRouter

class ArticleDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ArticleDetailViewController: Router.PageProvider {
    
    static func page(for url: URL) -> UIViewController? {        
        let detailPage = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: Bundle(for: ArticleDetailViewController.self))
        detailPage.navigationItem.title = "文章详情"
        return detailPage
    }        
}
