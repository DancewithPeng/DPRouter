//
//  QuestionModule.swift
//  Question
//
//  Created by 张鹏 on 2020/10/9.
//

import UIKit
import DPModuleManager
import DPRouter

class QuestionModule: Module {
    override func didLoad() {
        super.didLoad()
        
        DPRouter.shared.register(QuestionListViewController.self)
    }
}
