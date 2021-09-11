//
//  NSURL+DPRouterConvenient.swift
//  DPRouter
//
//  Created by 张鹏 on 2020/10/12.
//

import Foundation

/// 根据字符串字面量来初始化URL对象
extension URL: ExpressibleByStringLiteral {
    
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: String) {
        self.init(string: value)!
    }
}

extension URL {
    
    /// 查询参数
    public var queries: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: self.baseURL != nil) else {
            return nil
        }
        
        guard let items = components.queryItems else {
            return nil
        }
        
        var results = [String: String]()
        
        for item in items {
            results[item.name] = item.value ?? ""
        }
        
        return results
    }
    
    /// 资源名称（host+path）
    public var resourceName: String {
        return "\(self.host ?? "")\(self.path)"
    }
}
