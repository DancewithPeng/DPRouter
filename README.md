# DPRouter

UIKit的路由工具

## 导入

DPRouter支持**Swift Package**和**CocoaPods**

### Swift Package

如果使用**Swift Package**，在`Package.swift`中加入

```swift
dependencies: [
    .package(url: "https://github.com/DancewithPeng/DPRouter.git", .upToNextMinor(from: "1.0.0"))
]
```

### CocoaPods

在`Podfile`文件中加入

```ruby
pod 'DPRouter', '~> 1.0.0'
```

## 使用

### Step1

首先需要在路由的目标页面遵循`DPRouterPage`协议，并实现协议中规定的方法

```swift
extension ArticleDetailViewController: DPRouterPage {
  	// 返回目标页面对应的URL
    static var pageURL: URL {
        "sub.myhost.com/articles/detail"
    }
    
  	// 通过静态方法，返回URL对应的ViewController实例
    static func page(for url: URL) -> UIViewController? {
        let detailPage = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: Bundle(for: ArticleDetailViewController.self))
        detailPage.navigationItem.title = "文章详情"
        return detailPage
    }       
}
```

### Step2

其次在进行路由之前，需要先将页面注册到DPRouter中

```swift
DPRouter.shared.register(ArticleDetailViewController.self)
```

### Step3

在需要进行路由的调用处，通过URL获取页面的实例，然后进行页面的跳转或呈现

```swift
guard let detailPage = DPRouter.shared.page(for: "sub.myhost.com/articles/detail") else {
    return
}
// 在这里进行页面的跳转或者呈现
```



## LICENSE

此项目采用**MIT**开源协议，[点击查看详情](LICENSE)

