//
//  DPRouterPageBuilder.swift
//  DPRouter
//
//  Created by 张鹏 on 2020/10/26.
//

import Foundation

public func DPRoute(_ url: URL, _ pageProvider: Router.PageProvider.Type) {
    Router.ResourceDespatcher.shared.register(pageProvider, for: url)
}
