# DPRouter

[TOC]

UIKit的路由工具



## 导入

DPRouter支持**Swift Package**和**CocoaPods**

### Swift Package

如果使用**Swift Package**，在`Package.swift`中加入

```swift
dependencies: [
    .package(url: "https://github.com/DancewithPeng/DPRouter.git", .upToNextMinor(from: "1.2.0"))
]
```

### CocoaPods

在`Podfile`文件中加入

```ruby
pod 'DPUIKitRouter', '~> 1.3.0'
```

> 因为`DPRouter`这个名字的Pod库已经存在，所以没有使用`DPRouter`作为Pod库的名称



## 使用

### Step1

首先需要在路由的目标页面遵循`DPRouterPage`协议，并实现协议中规定的方法

```swift
extension ArticleDetailViewController: Router.PageProvider {
    
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
DPRoute("sub.myhost.com/articles/detail", ArticleDetailViewController.self)
```

### Step3

在需要进行路由的调用处，通过URL进行路由

```swift
Router.shared.route(to: "sub.myhost.com/articles/detail")
```

### 自定义路由策略

DPRouter提供路由策略的注册，可以给每个不同的URL指定不同的策略

首先需要先实现自己的路由策略

```swift
final class MyRoutePolicy: NSObject, RoutePolicy {
    
    static func policy() -> MyRoutePolicy {
        return MyRoutePolicy()
    }
    
    func route(with url: URL) -> Bool {
      	// 这里可以通过Router.ResourceDespatcher获取对应的页面对象
      	// 如果这里实现的是routeTargetPage(_:,url:)，那么会自定执行`Router.ResourceDespatcher.shared.page(for:)`方法获取对应的页面
        let targetPage = Router.ResourceDespatcher.shared.page(for: url)
        // 这里自定义呈现targetPage的逻辑
      	return true
    }
}
```

然后在初始化时，向Router注册策略，当遇到对应的URL时，就会选取对应的策略进行路由

```swift
Router.shared.register(MyRoutePolicy.policy(), for: "sub.myhost.com/articles/detail")
```

也可以指定`Router`的默认策略，当没有针对特定的URL注册策略时，会通过默认的策略进行处理。DPRouter中提供了`Router.ShowOnCurrentPageRoutePolicy`作为默认策略，你也可以指定自己的默认策略

```swift
Router.shared.defaultRoutePolicy = ...
```



## 设计理念

希望DPRouter提供以下功能：

- 根据URL跳转至指定的页面
  - 根据URL获取对应的资源，页面是资源的一种
    - 如何获取资源
      - 生产资源
        - 资源构造器
          - 页面资源构造器
          - 其他资源构造器
      - 访问资源
        - 资源访问器
  - 指定跳转的策略
    - 不同的页面可以指定不同的策略



## LICENSE

此项目采用**MIT**开源协议，[点击查看详情](LICENSE)

