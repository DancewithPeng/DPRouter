//
//  QuestionListViewController.swift
//  Question
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPRouter

class QuestionListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "问题列表"
    }
}

extension QuestionListViewController: DPRouterPage {    
    
    static var pageURL: URL {
        return URL(string: "sub.myhost.com/questions")!
    }
    
    static func page(for url: URL) -> UIViewController? {
        
        let questionPage = QuestionListViewController(nibName: "QuestionListViewController", bundle: Bundle(for: QuestionListViewController.self))
        questionPage.title = "问题"
        
        if let navParam = url.queries?["nav"],
           let needsNav = Int(navParam),
           needsNav == 1 {
            return UINavigationController(rootViewController: questionPage)
        } else {
            return questionPage
        }
    }
}
