// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DPRouter",
    products: [
        .library(
            name: "DPRouter",
            targets: ["DPRouter", "DPRouterSwift"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "DPRouter",
            dependencies: [],
            path: "DPRouter/Sources",
            exclude: ["Convenients/NSURL+DPRouterConvenient.swift"]),
        .target(
            name: "DPRouterSwift",
            dependencies: [],
            path: "DPRouter/Sources/Convenients",
            exclude: [
                "NSString+DPRouterConvenient.h",
                "NSString+DPRouterConvenient.m",
                "NSURL+DPRouterConvenient.h",
                "NSURL+DPRouterConvenient.m"
            ]),
    ]
)
